package com.xuwuji.eshop.controller;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.github.wxpay.sdk.WXPayUtil;
import com.xuwuji.eshop.admin.service.PayService;
import com.xuwuji.eshop.admin.service.TemplateService;
import com.xuwuji.eshop.db.dao.OrderDao;
import com.xuwuji.eshop.db.dao.OrderItemDao;
import com.xuwuji.eshop.db.dao.TranscationDao;
import com.xuwuji.eshop.db.dao.UserDao;
import com.xuwuji.eshop.model.Order;
import com.xuwuji.eshop.model.OrderStatus;
import com.xuwuji.eshop.model.Transcation;
import com.xuwuji.eshop.model.TranscationStateEnum;
import com.xuwuji.eshop.model.TranscationTypeEnum;
import com.xuwuji.eshop.model.User;
import com.xuwuji.eshop.model.WxTradeState;
import com.xuwuji.eshop.util.PayUtil;
import com.xuwuji.eshop.util.TokenUtil;

@RestController
@RequestMapping("/pay")
public class PayController {
	private static final String SUCCESS = "SUCCESS";
	private static final String FAIL = "FAIL";
	@Autowired
	private UserDao userDao;
	@Autowired
	private OrderDao orderDao;
	@Autowired
	// 发送模板消息
	private TemplateService templateService;
	@Autowired
	// 支付处理服务
	private PayService payService;

	@Autowired
	private TranscationDao transcationDao;

	/**
	 * 使用微信对订单进行付款
	 * 
	 * 使用条件：余额 < 待付款金额
	 * 
	 * 1.调用微信的统一支付接口
	 * 
	 * 2.返回结果给前端，唤起收银台，让用户进行付款操作
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/wxPay", method = RequestMethod.GET)
	public Map<String, Object> wxPay(HttpServletRequest request) {
		try {
			String orderId = request.getParameter("orderId");
			Order order = orderDao.getOrderInfoByOrderId(orderId);
			double orderAmount = order.getAmount();
			String amount = String.valueOf((int) (orderAmount * 100));
			String openId = order.getOpenId();
			User user = new User();
			user.setOpenId(openId);
			user = userDao.getByCondition(user);
			// 如果是老用户，则查看是否有余额，有的话，减掉余额
			if (user.getId() > 0) {
				double balance = user.getBalance();
				if (balance > 0) {
					amount = String.valueOf((int) ((orderAmount - balance) * 100));
				}
			}
			// 添加此条流水记录
			String transcationId = System.nanoTime() + TranscationTypeEnum.WXPAY.getCode() + amount;
			Transcation transcation = new Transcation();
			transcation.setOrderId(orderId);
			transcation.setAmount(Double.valueOf(amount));
			transcation.setOccur(new Date());
			transcation.setOpenId(openId);
			transcation.setTranscationId(transcationId);
			transcation.setType(TranscationTypeEnum.WXPAY.getCode());
			transcation.setState(TranscationStateEnum.I.getCode());
			transcationDao.add(transcation);
			// 生成的随机字符串
			String nonce_str = WXPayUtil.generateNonceStr();
			// 商品名称
			String body = "XIAOCHAISELECT";
			// 获取客户端的ip地址
			String spbill_create_ip = "10.59.163.204";
			// 组装参数，用户生成统一下单接口的签名
			Map<String, String> packageParams = new HashMap<>();
			packageParams.put("appid", TokenUtil.APPID);
			packageParams.put("mch_id", TokenUtil.MERCHANT_ID);
			packageParams.put("nonce_str", nonce_str);
			packageParams.put("body", body);
			packageParams.put("out_trade_no", orderId + "");// 商户订单号,自己的订单ID
			packageParams.put("total_fee", amount + "");// 支付金额，这边需要转成字符串类型，否则后面的签名会失败
			packageParams.put("spbill_create_ip", spbill_create_ip);
			packageParams.put("notify_url", TokenUtil.NOTIFY_URL);// 支付成功后的回调地址
			packageParams.put("trade_type", TokenUtil.TRADETYPE);// 支付方式
			packageParams.put("openid", openId + "");// 用户的openID，自己获取
			String sign = WXPayUtil.generateSignature(packageParams, TokenUtil.MERCHANT_KEY);
			// MD5运算生成签名，这里是第一次签名，用于调用统一下单接口
			System.out.println(sign);
			// 拼接统一下单接口使用的xml数据，要将上一步生成的签名一起拼接进去
			String xml = "<xml>" + "<appid>" + TokenUtil.APPID + "</appid>" + "<body>XIAOCHAISELECT</body>" + "<mch_id>"
					+ TokenUtil.MERCHANT_ID + "</mch_id>" + "<nonce_str>" + nonce_str + "</nonce_str>" + "<notify_url>"
					+ TokenUtil.NOTIFY_URL + "</notify_url>" + "<openid>" + openId + "</openid>" + "<out_trade_no>"
					+ orderId + "</out_trade_no>" + "<spbill_create_ip>" + spbill_create_ip + "</spbill_create_ip>"
					+ "<total_fee>" + amount + "</total_fee>"// 支付的金额，单位：分
					+ "<trade_type>" + TokenUtil.TRADETYPE + "</trade_type>" + "<sign>" + sign + "</sign>" + "</xml>";
			System.out.println(xml);
			// 调用统一下单接口，并接受返回的结果
			String result = PayUtil.httpRequest(TokenUtil.PAY_URL, "POST", xml);
			// result = "<?xml version=\"1.0\" encoding=\"gbk\"?>" + result;
			System.out.println(result);
			// 将解析结果存储在HashMap中
			Map map = PayUtil.doXMLParse(result);
			System.out.println(map);
			String return_code = (String) map.get("return_code");// 返回状态码
			String result_code = (String) map.get("result_code");// 返回结果码
			Map<String, Object> response = new HashMap<String, Object>();// 返回给小程序端需要的参数
			if (return_code.equals(SUCCESS) && result_code.equals(SUCCESS)) {
				String prepay_id = (String) map.get("prepay_id");// 返回的预付单信息
				response.put("nonceStr", nonce_str);
				response.put("package", "prepay_id=" + prepay_id);
				Long timeStamp = System.currentTimeMillis() / 1000;
				response.put("timeStamp", timeStamp + "");// 这边要将返回的时间戳转化成字符串，不然小程序端调用wx.requestPayment方法会报签名错误
				// 拼接签名需要的参数
				String stringSignTemp = "appId=" + TokenUtil.APPID + "&nonceStr=" + nonce_str + "&package=prepay_id="
						+ prepay_id + "&signType=MD5&timeStamp=" + timeStamp;
				// 再次签名，这个签名用于小程序端调用wx.requesetPayment方法
				String paySign = PayUtil.sign(stringSignTemp, TokenUtil.MERCHANT_KEY, "utf-8").toUpperCase();
				response.put("paySign", paySign);
				orderDao.updatePrepayId(orderId, prepay_id);
				// 更新流水，将状态设置为进行中
				transcation.setPrepayId(prepay_id);
				transcation.setLastModified(new Date());
				transcation.setState(TranscationStateEnum.D.getCode());
				transcationDao.update(transcation);
			}
			/**
			 * 出现场景：
			 * 
			 * 1、用户第一次唤起收银台，但是点叉没付款，此订单进入待支付
			 * 
			 * 2、用户在操作后，余额发生了变化，然后重新对此订单进行付款
			 * 
			 * 3、由于支持余额和微信共同支付，且默认先划扣余额 此时需要支付的金额，和最初下单时唤起收银台后在微信支付内部保存的金额产生了不一致
			 * 
			 * 4、返回的错误结果result_code=FAIL && err_code=INVALID_REQUEST
			 * 
			 * 5、此时返回给前台，金额不对，自动将此订单直接关闭，让用户重新下单
			 */
			else if (return_code.equals(SUCCESS) && result_code.equals(FAIL)
					&& ((String) map.get("err_code")).equals("INVALID_REQUEST")) {
				response.put("amountChange", true);
				orderDao.updateState(orderId, OrderStatus.FAIL.getCode());
			}
			response.put("appid", TokenUtil.APPID);
			response.put("transcationId", transcationId);
			return response;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 这里是支付回调接口，微信支付成功后会自动调用
	@RequestMapping(value = "/wxNotify", method = RequestMethod.POST)
	public void wxNotify(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
		String line = null;
		StringBuilder sb = new StringBuilder();
		while ((line = br.readLine()) != null) {
			sb.append(line);
		}
		br.close();
		// sb为微信返回的xml
		String notityXml = sb.toString();
		System.out.println(notityXml);
		notityXml = "<?xml version=\"1.0\" encoding=\"gbk\"?>" + notityXml;
		String resXml = "";
		Map map = PayUtil.doXMLParse(notityXml);
		String returnCode = (String) map.get("return_code");
		if ("SUCCESS".equals(returnCode)) {
			// 验证签名是否正确
			Map<String, String> validParams = PayUtil.paraFilter(map); // 回调验签时需要去除sign和空值参数
			String prestr = PayUtil.createLinkString(validParams);
			// 根据微信官网的介绍，此处不仅对回调的参数进行验签，还需要对返回的金额与系统订单的金额进行比对等
			if (PayUtil.verify(prestr, (String) map.get("sign"), TokenUtil.MERCHANT_KEY, "utf-8")) {
				/** 此处添加自己的业务逻辑代码start **/

				// 注意要判断微信支付重复回调，支付成功后微信会重复的进行回调

				/** 此处添加自己的业务逻辑代码end **/
				// 通知微信服务器已经支付成功
				resXml = "<xml>" + "<return_code><![CDATA[SUCCESS]]></return_code>"
						+ "<return_msg><![CDATA[OK]]></return_msg>" + "</xml> ";
			}
		} else {
			resXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>"
					+ "<return_msg><![CDATA[报文为空]]></return_msg>" + "</xml> ";
		}
		BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
		out.write(resXml.getBytes());
		out.flush();
		out.close();
	}

	/**
	 * 查询订单支付状态
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/orderQuery", method = RequestMethod.GET)
	public Map<String, Object> orderQuery(HttpServletRequest request, HttpServletResponse response) {
		try {
			String orderId = request.getParameter("orderId");
			Order order = orderDao.getOrderInfoByOrderId(orderId);
			if (order == null) {
				return null;
			}
			String transcationId = request.getParameter("transcationId");
			Transcation transcation = null;
			if (transcationId != null) {
				transcation = transcationDao.getByTranscationId(transcationId);
			}
			// 生成的随机字符串
			String nonce_str = WXPayUtil.generateNonceStr();
			// 组装参数，用户生成统一下单接口的签名
			Map<String, String> packageParams = new HashMap<>();
			packageParams.put("appid", TokenUtil.APPID);
			packageParams.put("mch_id", TokenUtil.MERCHANT_ID);
			packageParams.put("nonce_str", nonce_str);
			packageParams.put("out_trade_no", orderId + "");// 商户订单号,自己的订单ID
			packageParams.put("nonce_str", nonce_str);// 支付成功后的回调地址
			String sign = WXPayUtil.generateSignature(packageParams, TokenUtil.MERCHANT_KEY);
			// MD5运算生成签名，这里是第一次签名，用于调用统一下单接口
			System.out.println(sign);
			// 拼接统一下单接口使用的xml数据，要将上一步生成的签名一起拼接进去
			String xml = "<xml>" + "<appid>" + TokenUtil.APPID + "</appid>" + "<mch_id>" + TokenUtil.MERCHANT_ID
					+ "</mch_id>" + "<nonce_str>" + nonce_str + "</nonce_str>" + "<out_trade_no>" + orderId
					+ "</out_trade_no>" + "<sign>" + sign + "</sign>" + "</xml>";
			System.out.println(xml);
			// 调用统一下单接口，并接受返回的结果
			String result = PayUtil.httpRequest(TokenUtil.ORDER_QUERY_URL, "POST", xml);
			// result = "<?xml version=\"1.0\" encoding=\"gbk\"?>" + result;
			System.out.println(result);
			// 将解析结果存储在HashMap中
			Map map = PayUtil.doXMLParse(result);
			System.out.println(map);
			String return_code = (String) map.get("return_code");// 返回状态码
			String result_code = (String) map.get("result_code");// 返回结果码
			// 状态码为SUCCESS时可以进行判断
			if (return_code.equals(SUCCESS)) {
				// 结果码为SUCCESS时说明已经调用统一支付创建了订单，可以进行判断是否付款成功
				if (result_code.equals(SUCCESS)) {
					// 此订单的交易状态
					String trade_state = (String) map.get("trade_state");
					// 此订单交易成功
					if (trade_state.equals(WxTradeState.SUCCESS.getCode())) {
						// 对已经付款成功的订单进行更新，此时订单此时在系统内还处于未支付状态
						if (order.getState().equals(OrderStatus.NOTPAY.getCode())) {
							// 微信支付交易单号
							String wxTranscationId = (String) map.get("transaction_id");
							// 更新订单，状态设为已付款，添加交易单号
							orderDao.updateState(orderId, OrderStatus.NOTSEND.getCode());
							orderDao.updateTransactionId(orderId, wxTranscationId);
							// 发送模板消息，提示已经支付成功
							templateService.handlePayed(order);
							payService.pay(orderId);
							/**
							 * 因为能够使用微信付款时，说明:
							 * 
							 * 1、余额小于待付款金额，此时余额已被全部抵扣
							 * 
							 * 2、余额为0
							 * 
							 * 此时需要:
							 * 
							 * 1、更新此订单，明确有多少是从余额中划扣（其实是此用户所有的余额）
							 * 
							 * 2、将用户的余额置空
							 */
							updateBalance(orderId, order.getOpenId(), 0, true);
							if (transcation != null
									&& transcation.getState().equals(TranscationStateEnum.D.getCode())) {
								// 更新流水，状态更新为已成功，添加微信交易流水号
								transcation.setLastModified(new Date());
								transcation.setState(TranscationStateEnum.S.getCode());
								transcation.setWxTranscationId(wxTranscationId);
								transcationDao.update(transcation);
							}
						}
					}
					// 此订单还未付款
					else if (trade_state.equals(WxTradeState.NOTPAY.getCode())) {
						// 说明唤起收银台了，但是还没有付款成功，此时提醒其有待支付的订单
						templateService.handleWaitPay(order);
						// 将此条流水置为失败状态
						if (transcation != null) {
							transcation.setLastModified(new Date());
							transcation.setState(TranscationStateEnum.F.getCode());
							transcationDao.update(transcation);
						}
					}
				}
				// 结果码为FAIL时说明此订单号没有调用统一支付，订单不存在或者出现异常
				else if (result_code.equals(FAIL)) {
					if (transcation != null) {
						transcation.setLastModified(new Date());
						transcation.setState(TranscationStateEnum.F.getCode());
						transcationDao.update(transcation);
					}
				}
			}
			return map;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/sendNotice", method = RequestMethod.GET)
	public String sendNotice(HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException, UnsupportedEncodingException {
		String orderId = request.getParameter("orderId");
		Order order = orderDao.getOrderInfoByOrderId(orderId);
		TemplateService TemplateService = new TemplateService();
		OrderItemDao orderItemDao = new OrderItemDao();
		order.setOrderItemsList(orderItemDao.getByOrderId(order.getOrderId()));
		String result = TemplateService.handleWaitPay(order);
		return result;
	}

	/**
	 * 使用余额对订单进行付款
	 * 
	 * 使用条件：余额 >= 待付款金额
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/balancePay", method = RequestMethod.GET)
	public void balancePay(HttpServletRequest request) {
		String orderId = request.getParameter("orderId");
		Order order = orderDao.getOrderInfoByOrderId(orderId);
		double orderAmount = order.getAmount();
		String openId = order.getOpenId();
		// 添加此条流水记录
		String transcationId = System.nanoTime() + TranscationTypeEnum.BALANCEPAY.getCode()
				+ (int) (Double.valueOf(orderAmount) * 100);
		Transcation transcation = new Transcation();
		transcation.setOrderId(orderId);
		// 流水表内金额以分为单位
		transcation.setAmount((int) (Double.valueOf(orderAmount) * 100));
		transcation.setOccur(new Date());
		transcation.setOpenId(openId);
		transcation.setTranscationId(transcationId);
		transcation.setType(TranscationTypeEnum.BALANCEPAY.getCode());
		transcation.setState(TranscationStateEnum.I.getCode());
		transcationDao.add(transcation);
		payService.pay(orderId);
		/**
		 * 1、从用户余额中划扣此次的消费，也就是订单的金额
		 * 
		 * 2、更新订单，所有金额均是由用户余额进行支付
		 */
		updateBalance(orderId, openId, orderAmount, false);
		// 更新流水状态
		transcation.setState(TranscationStateEnum.S.getCode());
		transcation.setLastModified(new Date());
		// 更新订单，状态设为已付款
		orderDao.updateState(orderId, OrderStatus.NOTSEND.getCode());
		// 由于是余额支付，支付的流水单号为系统内部流水单号
		orderDao.updateTransactionId(orderId, transcationId);
		transcationDao.update(transcation);
	}

	/**
	 * 更新订单余额字段、划扣用户余额
	 * 
	 * @param openId
	 * @param orderAmount
	 * @param toZero
	 */
	private void updateBalance(String orderId, String openId, double orderAmount, boolean isWxPay) {
		User user = new User();
		user.setOpenId(openId);
		user = userDao.getByCondition(user);
		// 使用微信支付
		if (isWxPay) {
			// 此订单使用了用户全部的余额，剩余部分用微信进行支付
			orderDao.updateBalanceAmount(orderId, user.getBalance());
			// 用户余额归零
			user.setBalance(0);
		}
		// 使用余额支付
		else {
			// 此订单全部都由用户余额进行支付
			orderDao.updateBalanceAmount(orderId, orderAmount);
			// 划扣用户余额
			user.setBalance(user.getBalance() - orderAmount);
		}
		userDao.update(user);
	}
}

package com.xuwuji.eshop.controller;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.github.wxpay.sdk.WXPayUtil;
import com.xuwuji.eshop.db.dao.OrderDao;
import com.xuwuji.eshop.model.Order;
import com.xuwuji.eshop.util.PayUtil;
import com.xuwuji.eshop.util.TokenUtil;

@RestController
@RequestMapping("/pay")
public class PayController {

	@Autowired
	private OrderDao orderDao;

	@RequestMapping(value = "/wxPay", method = RequestMethod.GET)
	public Map<String, Object> wxPay(HttpServletRequest request) {
		try {
			String orderId = request.getParameter("orderId");
			Order order = orderDao.getOrderInfoByOrderId(orderId);
			String openId = order.getOpenId();
			String amount = String.valueOf((int) (order.getAmount() * 100));
			// 生成的随机字符串
			String nonce_str = WXPayUtil.generateNonceStr();
			// 商品名称
			String body = "aaaa";
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
			String xml = "<xml>" + "<appid>" + TokenUtil.APPID + "</appid>" + "<body>aaaa</body>" + "<mch_id>"
					+ TokenUtil.MERCHANT_ID + "</mch_id>" + "<nonce_str>" + nonce_str + "</nonce_str>" + "<notify_url>"
					+ TokenUtil.NOTIFY_URL + "</notify_url>" + "<openid>" + openId + "</openid>" + "<out_trade_no>"
					+ orderId + "</out_trade_no>" + "<spbill_create_ip>" + spbill_create_ip + "</spbill_create_ip>"
					+ "<total_fee>" + amount + "</total_fee>"// 支付的金额，单位：分
					+ "<trade_type>" + TokenUtil.TRADETYPE + "</trade_type>" + "<sign>" + sign + "</sign>" + "</xml>";
			System.out.println(xml);
			// 调用统一下单接口，并接受返回的结果
			String result = PayUtil.httpRequest(TokenUtil.PAY_URL, "POST", xml);
			System.out.println(result);
			// 将解析结果存储在HashMap中
			Map map = PayUtil.doXMLParse(result);
			String return_code = (String) map.get("return_code");// 返回状态码
			Map<String, Object> response = new HashMap<String, Object>();// 返回给小程序端需要的参数
			if (return_code.equals("SUCCESS")) {
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
			}
			response.put("appid", TokenUtil.APPID);
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

	@RequestMapping(value = "/orderQuery", method = RequestMethod.GET)
	public Map<String, Object> orderQuery(HttpServletRequest request) {
		try {
			String orderId = request.getParameter("orderId");
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
			System.out.println(result);
			// 将解析结果存储在HashMap中
			Map map = PayUtil.doXMLParse(result);
//			String return_code = (String) map.get("return_code");// 返回状态码
//			Map<String, Object> response = new HashMap<String, Object>();// 返回给小程序端需要的参数
//			if (return_code.equals("SUCCESS")) {
//				String prepay_id = (String) map.get("prepay_id");// 返回的预付单信息
//				response.put("nonceStr", nonce_str);
//				response.put("package", "prepay_id=" + prepay_id);
//				Long timeStamp = System.currentTimeMillis() / 1000;
//				response.put("timeStamp", timeStamp + "");// 这边要将返回的时间戳转化成字符串，不然小程序端调用wx.requestPayment方法会报签名错误
//				// 拼接签名需要的参数
//				String stringSignTemp = "appId=" + TokenUtil.APPID + "&nonceStr=" + nonce_str + "&package=prepay_id="
//						+ prepay_id + "&signType=MD5&timeStamp=" + timeStamp;
//				// 再次签名，这个签名用于小程序端调用wx.requesetPayment方法
//				String paySign = PayUtil.sign(stringSignTemp, TokenUtil.MERCHANT_KEY, "utf-8").toUpperCase();
//				response.put("paySign", paySign);
//			}
//			response.put("appid", TokenUtil.APPID);
			// return response;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 获取IP
	private String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");
		if (!ip.isEmpty() && !"unKnown".equalsIgnoreCase(ip)) {
			// 多次反向代理后会有多个ip值，第一个ip才是真实ip
			int index = ip.indexOf(",");
			if (index != -1) {
				return ip.substring(0, index);
			} else {
				return ip;
			}
		}
		ip = request.getHeader("X-Real-IP");
		if (!ip.isEmpty() && !"unKnown".equalsIgnoreCase(ip)) {
			return ip;
		}
		return request.getRemoteAddr();
	}
}

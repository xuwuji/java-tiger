package com.xuwuji.eshop.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.wxpay.sdk.WXPayUtil;
import com.xuwuji.eshop.db.dao.TranscationDao;
import com.xuwuji.eshop.db.dao.UserDao;
import com.xuwuji.eshop.model.Order;
import com.xuwuji.eshop.model.Transcation;
import com.xuwuji.eshop.model.TranscationStateEnum;
import com.xuwuji.eshop.model.TranscationTypeEnum;
import com.xuwuji.eshop.util.PayUtil;
import com.xuwuji.eshop.util.TimeUtil;
import com.xuwuji.eshop.util.TokenUtil;

@Controller
@RequestMapping(value = "/balance")
public class BalanceController {

	private static final String SUCCESS = "SUCCESS";
	private static final String FAIL = "FAIL";

	@Autowired
	private UserDao userDao;

	@Autowired
	private TranscationDao transcationDao;

	@RequestMapping(value = "/topUp", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> topUp(HttpServletRequest request) {
		try {
			String amount = request.getParameter("amount");
			String openId = request.getParameter("openId");
			String transcationId = TimeUtil.dateToString(new Date()) + TranscationTypeEnum.TOPUP.getCode() + openId
					+ amount;
			String topUpAmount = String.valueOf((int) (Double.valueOf(amount) * 100));
			// 1. 初始化一条交易记录
			Transcation transcation = new Transcation();
			transcation.setAmount(Double.valueOf(amount));
			transcation.setOccur(new Date());
			transcation.setOpenId(openId);
			transcation.setTranscationId(transcationId);
			transcation.setType(TranscationTypeEnum.TOPUP.getCode());
			transcation.setState(TranscationStateEnum.I.getCode());
			transcationDao.add(transcation);
			// 2. 构造统一支付
			// 生成的随机字符串
			String nonce_str = WXPayUtil.generateNonceStr();
			// 商品名称
			String body = "用户{openId}向余额充值{amount}元".replace("{openId}", openId).replace("{amount}", amount);
			// 获取客户端的ip地址
			String spbill_create_ip = "10.59.163.204";
			// 组装参数，用户生成统一下单接口的签名
			Map<String, String> packageParams = new HashMap<>();
			packageParams.put("appid", TokenUtil.APPID);
			packageParams.put("mch_id", TokenUtil.MERCHANT_ID);
			packageParams.put("nonce_str", nonce_str);
			packageParams.put("body", body);
			packageParams.put("out_trade_no", transcationId + "");// 商户订单号,自己的订单ID
			packageParams.put("total_fee", amount + "");// 支付金额，这边需要转成字符串类型，否则后面的签名会失败
			packageParams.put("spbill_create_ip", spbill_create_ip);
			packageParams.put("notify_url", TokenUtil.NOTIFY_URL);// 支付成功后的回调地址
			packageParams.put("trade_type", TokenUtil.TRADETYPE);// 支付方式
			packageParams.put("openid", openId + "");// 用户的openID，自己获取
			String sign = WXPayUtil.generateSignature(packageParams, TokenUtil.MERCHANT_KEY);
			// MD5运算生成签名，这里是第一次签名，用于调用统一下单接口
			System.out.println(sign);
			// 拼接统一下单接口使用的xml数据，要将上一步生成的签名一起拼接进去
			String xml = "<xml>" + "<appid>" + TokenUtil.APPID + "</appid>" + "<body>" + body + "</body>" + "<mch_id>"
					+ TokenUtil.MERCHANT_ID + "</mch_id>" + "<nonce_str>" + nonce_str + "</nonce_str>" + "<notify_url>"
					+ TokenUtil.NOTIFY_URL + "</notify_url>" + "<openid>" + openId + "</openid>" + "<out_trade_no>"
					+ transcationId + "</out_trade_no>" + "<spbill_create_ip>" + spbill_create_ip
					+ "</spbill_create_ip>" + "<total_fee>" + topUpAmount + "</total_fee>"// 支付的金额，单位：分
					+ "<trade_type>" + TokenUtil.TRADETYPE + "</trade_type>" + "<sign>" + sign + "</sign>" + "</xml>";
			System.out.println(xml);
			// 调用统一下单接口，并接受返回的结果
			String result = PayUtil.httpRequest(TokenUtil.PAY_URL, "POST", xml);
			result = "<?xml version=\"1.0\" encoding=\"gbk\"?>" + result;
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
				transcation.setPrepayId(prepay_id);
				transcation.setLastModified(new Date());
				// 将状态设置为进行中
				transcation.setState(TranscationStateEnum.D.getCode());
				transcationDao.updatePrepayId(transcation);
			}
			response.put("appid", TokenUtil.APPID);
			return response;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}

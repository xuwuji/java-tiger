package com.xuwuji.eshop.util;

public class TokenUtil {
	public static final String APPID = "wxcfed1ad72ce2da1f";
	public static final String APPSECRET = "1a68074bde91d454a4afcd745bf4320d";
	public static final String OPENID = "openid";
	public static final String SELF_OPENID = "oX-br4neGzmMBKR7ByjoXRUA1-NM";
	public static final String MERCHANT_ID = "1532927271";
	public static final String MERCHANT_KEY = "xuwuji19920619xuwuji19920619xuwu";
	// 签名方式，固定值
	public static final String SIGNTYPE = "MD5";
	// 交易类型，小程序支付的固定值为JSAPI
	public static final String TRADETYPE = "JSAPI";
	// 微信统一下单接口地址
	public static final String PAY_URL = "https://api.mch.weixin.qq.com/pay/unifiedorder";
	// 微信统一下单回调地址
	public static final String NOTIFY_URL = "https://jawiv.cn/backend/pay/wxNotify";
	// 微信查询订单接口地址
	public static final String ORDER_QUERY_URL = "https://api.mch.weixin.qq.com/pay/orderquery";
	
	public static String getOpenId(String code) {
		String url = "https://api.weixin.qq.com/sns/jscode2session?appid=" + APPID + "&secret=" + APPSECRET
				+ "&grant_type=authorization_code&js_code=" + code;
		String openId = HttpUtil.getMethod(url, OPENID);
		return openId;
	}

	public static final String ACCESS_TOKEN = "access_token";

	public static String getAccessToken() {
		String url = "https://api.weixin.qq.com/cgi-bin/token?appid=" + TokenUtil.APPID + "&secret="
				+ TokenUtil.APPSECRET + "&grant_type=client_credential";
		return HttpUtil.getMethod(url, ACCESS_TOKEN);
	}

}

package com.xuwuji.eshop.util;

public class TokenUtil {
	public static final String APPID = "wxcfed1ad72ce2da1f";
	public static final String APPSECRET = "1a68074bde91d454a4afcd745bf4320d";
	public static final String OPENID = "openid";

	public static String getOpenId(String code) {
		String url = "https://api.weixin.qq.com/sns/jscode2session?appid=" + APPID + "&secret=" + APPSECRET
				+ "&grant_type=authorization_code&js_code=" + code;
		String openId = HttpUtil.getMethod(url, OPENID);
		return openId;
	}

}

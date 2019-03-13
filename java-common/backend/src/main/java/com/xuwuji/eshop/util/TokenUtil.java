package com.xuwuji.eshop.util;

public class TokenUtil {
	public static final String APPID = "wx7561e2d8b255ea10";
	public static final String APPSECRET = "fb82f205d7c0163e76437465d5882c09";
	public static final String OPENID = "openid";

	public static String getOpenId(String code) {
		String url = "https://api.weixin.qq.com/sns/jscode2session?appid=" + APPID + "&secret=" + APPSECRET
				+ "&grant_type=authorization_code&js_code=" + code;
		String openId = HttpUtil.getMethod(url, OPENID);
		return openId;
	}

}

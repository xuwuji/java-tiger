package com.xuwuji.eshop.model;

/**
 * eshop的基础配置信息
 * 
 * @author xuwuji
 *
 */
public class Config {

	// 徐小柴二维码的地址
	private String xxcUrl;
	// 首页公告的信息
	private String noticeMsg;

	public String getXxcUrl() {
		return xxcUrl;
	}

	public void setXxcUrl(String xxcUrl) {
		this.xxcUrl = xxcUrl;
	}

	public String getNoticeMsg() {
		return noticeMsg;
	}

	public void setNoticeMsg(String noticeMsg) {
		this.noticeMsg = noticeMsg;
	}

}

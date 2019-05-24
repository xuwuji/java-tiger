package com.xuwuji.eshop.model;

import java.util.Date;

public class LotteryShareHistory {
	private int id;
	// 分享人的openId
	private String sourceUser;
	// 打开人的openId
	private String openUser;
	private Date occur;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSourceUser() {
		return sourceUser;
	}

	public void setSourceUser(String sourceUser) {
		this.sourceUser = sourceUser;
	}

	public String getOpenUser() {
		return openUser;
	}

	public void setOpenUser(String openUser) {
		this.openUser = openUser;
	}

	public Date getOccur() {
		return occur;
	}

	public void setOccur(Date occur) {
		this.occur = occur;
	}

}

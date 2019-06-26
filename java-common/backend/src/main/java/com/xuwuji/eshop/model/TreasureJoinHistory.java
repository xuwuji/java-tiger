package com.xuwuji.eshop.model;

import java.util.Date;

public class TreasureJoinHistory {
	private int id;
	private String treasureItemId;
	// 参加此夺宝的用户
	private String openId;
	private int count;
	private Date occur;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTreasureItemId() {
		return treasureItemId;
	}

	public void setTreasureItemId(String treasureItemId) {
		this.treasureItemId = treasureItemId;
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public Date getOccur() {
		return occur;
	}

	public void setOccur(Date occur) {
		this.occur = occur;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

}

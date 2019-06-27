package com.xuwuji.eshop.model;

import java.util.Date;

public class TreasureShare {

	private int id;
	private String sourceUser;
	private String openUser;
	private String joinHistoryId;
	private String treasureItemId;
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

	public String getJoinHistoryId() {
		return joinHistoryId;
	}

	public void setJoinHistoryId(String joinHistoryId) {
		this.joinHistoryId = joinHistoryId;
	}

	public String getTreasureItemId() {
		return treasureItemId;
	}

	public void setTreasureItemId(String treasureItemId) {
		this.treasureItemId = treasureItemId;
	}

	public Date getOccur() {
		return occur;
	}

	public void setOccur(Date occur) {
		this.occur = occur;
	}
}

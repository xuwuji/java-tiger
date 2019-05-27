package com.xuwuji.eshop.model;

import java.util.Date;

public class BarginOrderHistory {

	private int id;
	private String barginOrderId;
	private String sourceUser;
	private String openUser;
	private Date occur;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBarginOrderId() {
		return barginOrderId;
	}

	public void setBarginOrderId(String barginOrderId) {
		this.barginOrderId = barginOrderId;
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

package com.xuwuji.eshop.model;

import java.util.Date;

public class BarginOrder {

	private int id;
	private String barginOrderId;
	private String barginItemId;
	private String openId;
	private Date occur;
	private int people;
	private int lastHour;
	// @link BarginOrderState
	private String state;

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

	public String getBarginItemId() {
		return barginItemId;
	}

	public void setBarginItemId(String barginItemId) {
		this.barginItemId = barginItemId;
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

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getLastHour() {
		return lastHour;
	}

	public void setLastHour(int lastHour) {
		this.lastHour = lastHour;
	}

}

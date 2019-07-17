package com.xuwuji.eshop.model;

import java.util.Date;

public class EntityTranscation {
	private int id;
	private String entityId;
	private String entityUserId;
	private String type;
	private String item;
	private Date occur;
	private double amount;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEntityId() {
		return entityId;
	}

	public void setEntityId(String entityId) {
		this.entityId = entityId;
	}

	public String getEntityUserId() {
		return entityUserId;
	}

	public void setEntityUserId(String entityUserId) {
		this.entityUserId = entityUserId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setAmount(int amount) {
	}

	public Date getOccur() {
		return occur;
	}

	public void setOccur(Date occur) {
		this.occur = occur;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

}

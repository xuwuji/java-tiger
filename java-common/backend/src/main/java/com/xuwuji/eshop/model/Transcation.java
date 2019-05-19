package com.xuwuji.eshop.model;

import java.util.Date;

/**
 * 交易记录
 * 
 * @author xuwuji
 *
 * @time May 20, 2019
 */
public class Transcation {

	private int id;
	private String transcationId;
	// @link TranscationTypeEnum
	private String type;
	private double amount;
	private String openId;
	private Date occur;
	private Date lastModified;
	private String prepayId;
	// @link TranscationStateEnum
	private String state;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTranscationId() {
		return transcationId;
	}

	public void setTranscationId(String transcationId) {
		this.transcationId = transcationId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
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

	public String getPrepayId() {
		return prepayId;
	}

	public void setPrepayId(String prepayId) {
		this.prepayId = prepayId;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Date getLastModified() {
		return lastModified;
	}

	public void setLastModified(Date lastModified) {
		this.lastModified = lastModified;
	}

}

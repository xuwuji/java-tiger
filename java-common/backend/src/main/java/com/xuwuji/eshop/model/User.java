package com.xuwuji.eshop.model;

import java.util.Date;

public class User {

	private int id;
	private String openId;
	private String wechatId;
	private String state;
	private double bonusAmount;
	//@{link UserLevel}
	private String level;
	private double totalPay;
	private Date membershipFirstDay;
	private double amountAfterMSFD;
	private double amountThisMonth;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getWechatId() {
		return wechatId;
	}

	public void setWechatId(String wechatId) {
		this.wechatId = wechatId;
	}

	public double getBonusAmount() {
		return bonusAmount;
	}

	public void setBonusAmount(double bonusAmount) {
		this.bonusAmount = bonusAmount;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public double getTotalPay() {
		return totalPay;
	}

	public void setTotalPay(double totalPay) {
		this.totalPay = totalPay;
	}

	public Date getMembershipFirstDay() {
		return membershipFirstDay;
	}

	public void setMembershipFirstDay(Date membershipFirstDay) {
		this.membershipFirstDay = membershipFirstDay;
	}

	public double getAmountAfterMSFD() {
		return amountAfterMSFD;
	}

	public void setAmountAfterMSFD(double amountAfterMSFD) {
		this.amountAfterMSFD = amountAfterMSFD;
	}

	public double getAmountThisMonth() {
		return amountThisMonth;
	}

	public void setAmountThisMonth(double amountThisMonth) {
		this.amountThisMonth = amountThisMonth;
	}

}

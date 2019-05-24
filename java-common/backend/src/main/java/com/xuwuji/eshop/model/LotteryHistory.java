package com.xuwuji.eshop.model;

import java.util.Date;

/**
 * 中奖纪录
 * 
 * @author xuwuji
 *
 */
public class LotteryHistory {

	private int id;
	private String openId;
	// @{link LotteryType} 现金还是礼品
	private String type;
	private String name;
	private double amount;
	private Date time;
	// 如果是抽到商品的话，判断是否已经兑换
	private String checkState;
	// 这一次属于用户的第几次抽奖
	private String lotteryTranscationId;
	// @{link LotteryState} 是否中奖
	private String isLuck;

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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public Date getTime() {
		return time;
	}

	public String getCheckState() {
		return checkState;
	}

	public void setCheckState(String checkState) {
		this.checkState = checkState;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getLotteryTranscationId() {
		return lotteryTranscationId;
	}

	public void setLotteryTranscationId(String lotteryTranscationId) {
		this.lotteryTranscationId = lotteryTranscationId;
	}

	public String getIsLuck() {
		return isLuck;
	}

	public void setIsLuck(String isLuck) {
		this.isLuck = isLuck;
	}

}

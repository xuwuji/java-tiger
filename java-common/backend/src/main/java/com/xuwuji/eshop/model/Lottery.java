package com.xuwuji.eshop.model;

/**
 * 
 * 抽奖
 * 
 * @author xuwuji
 *
 */
public class Lottery {

	private int id;
	// 钱/礼品 @{link LotteryType}
	private String type;
	private String name;
	private double amount;
	// 是否抽中
	private boolean isLuck;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public boolean isLuck() {
		return isLuck;
	}

	public void setLuck(boolean isLuck) {
		this.isLuck = isLuck;
	}

}

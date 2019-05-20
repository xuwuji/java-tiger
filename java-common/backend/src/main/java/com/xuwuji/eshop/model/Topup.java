package com.xuwuji.eshop.model;

import org.springframework.stereotype.Component;

@Component
public class Topup {
	private double amount;
	private double getAmount;

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public double getGetAmount() {
		return getAmount;
	}

	public void setGetAmount(double getAmount) {
		this.getAmount = getAmount;
	}
}

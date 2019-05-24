package com.xuwuji.eshop.model;

public class LotteryConfig {
	// 第一阶段
	public int lotteryStageOne;
	// 第二阶段
	public int lotteryStageTwo;
	// 第一阶段内单次最多抽到的金额
	public double amountPerInStageOne;
	// 第一阶段最多抽到的金额
	public double amountMaxInStageOne;
	// 第二阶段内单次最多抽到的金额
	public double amountPerInStageTwo;
	// 第二阶段最多抽到的金额
	public double amountMaxInStageTwo;
	// 第二阶段外单次最多抽到的金额
	public double amountPerOverStageTwo;

	public int getLotteryStageOne() {
		return lotteryStageOne;
	}

	public void setLotteryStageOne(int lotteryStageOne) {
		this.lotteryStageOne = lotteryStageOne;
	}

	public int getLotteryStageTwo() {
		return lotteryStageTwo;
	}

	public void setLotteryStageTwo(int lotteryStageTwo) {
		this.lotteryStageTwo = lotteryStageTwo;
	}

	public double getAmountPerInStageOne() {
		return amountPerInStageOne;
	}

	public void setAmountPerInStageOne(double amountPerInStageOne) {
		this.amountPerInStageOne = amountPerInStageOne;
	}

	public double getAmountMaxInStageOne() {
		return amountMaxInStageOne;
	}

	public void setAmountMaxInStageOne(double amountMaxInStageOne) {
		this.amountMaxInStageOne = amountMaxInStageOne;
	}

	public double getAmountPerInStageTwo() {
		return amountPerInStageTwo;
	}

	public void setAmountPerInStageTwo(double amountPerInStageTwo) {
		this.amountPerInStageTwo = amountPerInStageTwo;
	}

	public double getAmountMaxInStageTwo() {
		return amountMaxInStageTwo;
	}

	public void setAmountMaxInStageTwo(double amountMaxInStageTwo) {
		this.amountMaxInStageTwo = amountMaxInStageTwo;
	}

	public double getAmountPerOverStageTwo() {
		return amountPerOverStageTwo;
	}

	public void setAmountPerOverStageTwo(double amountPerOverStageTwo) {
		this.amountPerOverStageTwo = amountPerOverStageTwo;
	}

}

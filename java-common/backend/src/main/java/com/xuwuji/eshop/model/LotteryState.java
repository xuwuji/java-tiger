package com.xuwuji.eshop.model;

/**
 * 
 * 抽奖结果
 * 
 * @author xuwuji
 *
 */
public enum LotteryState {
	ISLUCK("中奖", "1"), NOLUCK("没中奖", "0");

	private String desc;
	private String code;

	private LotteryState(String desc, String code) {
		this.desc = desc;
		this.code = code;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public LotteryState getByCode(String code) {
		for (LotteryState lotteryState : LotteryState.values()) {
			if (lotteryState.code.equals(code)) {
				return lotteryState;
			}
		}
		return null;
	}
}

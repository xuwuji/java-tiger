package com.xuwuji.eshop.model;

/**
 * 
 * 中奖的种类，现金红包/礼品
 * 
 * @author xuwuji
 *
 */
public enum LotteryType {
	MONEY("money", "money"), GIFT("gift", "gift"), POINTS("points", "points");

	private String desc;
	private String code;

	private LotteryType(String desc, String code) {
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

	public LotteryType getByCode(String code) {
		for (LotteryType lotteryType : LotteryType.values()) {
			if (lotteryType.code.equals(code)) {
				return lotteryType;
			}

		}
		return null;
	}
}

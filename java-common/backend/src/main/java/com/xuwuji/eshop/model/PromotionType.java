package com.xuwuji.eshop.model;

public enum PromotionType {

	reduceMoney("0", "Âú¼õ"), GIFT("1", "ËÍÀñÆ·");

	private String desc;
	private String code;

	private PromotionType(String desc, String code) {
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

	public PromotionType getByCode(String code) {
		for (PromotionType status : PromotionType.values()) {
			if (status.code.equals(code)) {
				return status;
			}

		}
		return null;
	}
}

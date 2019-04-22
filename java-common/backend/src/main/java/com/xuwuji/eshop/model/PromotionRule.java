package com.xuwuji.eshop.model;

public enum PromotionRule {

	AMOUNT("Âú½ð¶î", "amount"), TOTAL("ÂúÊýÁ¿", "total");

	private String desc;
	private String code;

	private PromotionRule(String desc, String code) {
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

	public PromotionRule getByCode(String code) {
		for (PromotionRule status : PromotionRule.values()) {
			if (status.code.equals(code)) {
				return status;
			}

		}
		return null;
	}
}

package com.xuwuji.eshop.model;

/**
 * 
 * 
 * @author xuwuji
 *
 */
public enum BrandLevel {

	LOW("low", "0"), MEDIUM("medium", "1"), HIGH("high", "2"), SUPERHIGH("superhigh", "3");

	private String desc;
	private String code;

	private BrandLevel(String desc, String code) {
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

	public BrandLevel getByCode(String code) {
		for (BrandLevel brandLevel : BrandLevel.values()) {
			if (brandLevel.code.equals(code)) {
				return brandLevel;
			}

		}
		return null;
	}

}

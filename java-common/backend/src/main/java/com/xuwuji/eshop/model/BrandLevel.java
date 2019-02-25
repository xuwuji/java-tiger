package com.xuwuji.eshop.model;

/**
 * 品牌等级
 * 
 * @author xuwuji
 *
 */
public enum BrandLevel {

	LOW("低端", "0"), MIDUMM("中端", "1"), HIGH("高端", "2"), SUPERHIGH("超高端", "3");

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

package com.xuwuji.eshop.model;

public enum ActivityEnum {
	TOP("top", "top"), POPULAR("popular", "popular");

	private String desc;
	private String code;

	private ActivityEnum(String desc, String code) {
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

	public ActivityEnum getByCode(String code) {
		for (ActivityEnum status : ActivityEnum.values()) {
			if (status.code.equals(code)) {
				return status;
			}

		}
		return null;
	}
}

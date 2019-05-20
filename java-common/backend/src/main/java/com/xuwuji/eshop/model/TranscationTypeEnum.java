package com.xuwuji.eshop.model;

public enum TranscationTypeEnum {
	TOPUP("topup", "topup"), CONSUME("consume", "consume");

	private String desc;
	private String code;

	private TranscationTypeEnum(String desc, String code) {
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

	public TranscationTypeEnum getByCode(String code) {
		for (TranscationTypeEnum type : TranscationTypeEnum.values()) {
			if (type.code.equals(code)) {
				return type;
			}

		}
		return null;
	}
}

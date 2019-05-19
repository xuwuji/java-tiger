package com.xuwuji.eshop.model;

public enum TranscationStateEnum {
	I("初始化", "I"), D("正在进行", "D"), S("成功完成", "S"), F("失败结束", "F");

	private String desc;
	private String code;

	private TranscationStateEnum(String desc, String code) {
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

	public TranscationStateEnum getByCode(String code) {
		for (TranscationStateEnum state : TranscationStateEnum.values()) {
			if (state.code.equals(code)) {
				return state;
			}

		}
		return null;
	}
}

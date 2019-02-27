package com.xuwuji.eshop.model;

/**
 * basic state 基础状态
 * 
 * @author xuwuji
 *
 */
public enum ActiveStateEnum {
	ACTIVE("有效", "1"), INVALID("无效已下架", "0");

	private String desc;
	private String code;

	private ActiveStateEnum(String desc, String code) {
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

	public ActiveStateEnum getByCode(String code) {
		for (ActiveStateEnum status : ActiveStateEnum.values()) {
			if (status.code.equals(code)) {
				return status;
			}

		}
		return null;
	}

}

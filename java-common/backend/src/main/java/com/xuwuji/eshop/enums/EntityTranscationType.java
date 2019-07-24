package com.xuwuji.eshop.enums;

public enum EntityTranscationType {

	TOPUP("充值", "topup"), PAY("消费", "pay"),POINTS_PAY("积分消费","pointsPay");

	private String desc;
	private String code;

	private EntityTranscationType(String desc, String code) {
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

	public EntityTranscationType getByCode(String code) {
		for (EntityTranscationType type : EntityTranscationType.values()) {
			if (type.code.equals(code)) {
				return type;
			}
		}
		return null;
	}
}

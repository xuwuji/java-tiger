package com.xuwuji.eshop.model;

/**
 * 
 * 
 * @author xuwuji
 *
 */
public enum UserLevel {

	NORMAL("大众", "0"), GOLD("黄金", "1"), PLATINUM("铂金", "2"), DIAMOND("钻石", "3");

	private String desc;
	private String code;

	private UserLevel(String desc, String code) {
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

	public UserLevel getByCode(String code) {
		for (UserLevel userLevel : UserLevel.values()) {
			if (userLevel.code.equals(code)) {
				return userLevel;
			}

		}
		return null;
	}

}

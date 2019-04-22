package com.xuwuji.eshop.model;

/**
 * 
 * 
 * @author xuwuji
 *
 */
public enum UserState {

	NEW("新用户没付过款", "0"), PAID("付过款的老用户", "1"), INVALID("无效", "-1");

	private String desc;
	private String code;

	private UserState(String desc, String code) {
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

	public UserState getByCode(String code) {
		for (UserState userState : UserState.values()) {
			if (userState.code.equals(code)) {
				return userState;
			}

		}
		return null;
	}

}

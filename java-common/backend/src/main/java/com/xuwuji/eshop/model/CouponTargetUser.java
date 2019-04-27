package com.xuwuji.eshop.model;

/**
 * 
 * 
 * @author xuwuji
 *
 */
public enum CouponTargetUser {

	NEW("新人", "1"), ALL("所有人", "0");

	private String desc;
	private String code;

	private CouponTargetUser(String desc, String code) {
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

	public CouponTargetUser getByCode(String code) {
		for (CouponTargetUser couponTargetUser : CouponTargetUser.values()) {
			if (couponTargetUser.code.equals(code)) {
				return couponTargetUser;
			}

		}
		return null;
	}

}

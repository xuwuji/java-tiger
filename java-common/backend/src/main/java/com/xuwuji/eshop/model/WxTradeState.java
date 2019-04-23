package com.xuwuji.eshop.model;

/**
 * 微信支付的状态
 * 
 * @author xuwuji
 *
 */
public enum WxTradeState {

	SUCCESS("支付成功", "SUCCESS"), NOTPAY("订单未支付", "NOTPAY"), ORDERNOTEXIST("订单不存在", "ORDERNOTEXIST");

	private String desc;
	private String code;

	private WxTradeState(String desc, String code) {
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

	public WxTradeState getByCode(String code) {
		for (WxTradeState wxTradeState : WxTradeState.values()) {
			if (wxTradeState.code.equals(code)) {
				return wxTradeState;
			}
		}
		return null;
	}

}

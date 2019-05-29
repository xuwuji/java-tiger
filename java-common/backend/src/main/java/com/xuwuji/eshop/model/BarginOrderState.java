package com.xuwuji.eshop.model;

/**
 * 
 * 抽奖结果
 * 
 * @author xuwuji
 *
 */
public enum BarginOrderState {
	DOING("正在进行中", "D"), SUCCESS("已完成", "S"), CANCEL("用户取消", "C"), FAILED("已超时", "F"), PAY("用户提交了订单（无论是否支付成功）", "P");

	private String desc;
	private String code;

	private BarginOrderState(String desc, String code) {
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

	public BarginOrderState getByCode(String code) {
		for (BarginOrderState barginOrder : BarginOrderState.values()) {
			if (barginOrder.code.equals(code)) {
				return barginOrder;
			}
		}
		return null;
	}
}

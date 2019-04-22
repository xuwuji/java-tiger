package com.xuwuji.eshop.model;

/*
 * 订单的状态
 */
public enum OrderStatus {

	NOTPAY("待付款", "0"), NOTSEND("待发货", "1"), DELIVERED("已发货", "2"), FINISH("已完成", "3"), AFTERSALE("售后", "4");

	private String desc;
	private String code;

	private OrderStatus(String desc, String code) {
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

	public OrderStatus getByCode(String code) {
		for (OrderStatus orderStatus : OrderStatus.values()) {
			if (orderStatus.code.equals(code)) {
				return orderStatus;
			}

		}
		return null;
	}

}

package com.xuwuji.eshop.model;

import java.util.Date;
import java.util.List;

public class Order {

	private int id;
	private String wechatId;
	// 下单时间
	private Date time;
	/*
	 * {@Link} OrderStatus
	 */
	private String status;
	private String orderId;
	private List<OrderItem> orderItemsList;
	// 收件人手机号
	private String phoneNum;
	// 订单总额
	private double amount;
	// 总件数
	private int totalCount;
	// 收件人姓名
	private String recieverName;
	// 收货地址
	private String address;

	// 下单用户的openId
	private String openId;
	// 订单物流单号
	private String logisticsId;

	private String memo;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getWechatId() {
		return wechatId;
	}

	public void setWechatId(String wechatId) {
		this.wechatId = wechatId;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public List<OrderItem> getOrderItemsList() {
		return orderItemsList;
	}

	public void setOrderItemsList(List<OrderItem> orderItemsList) {
		this.orderItemsList = orderItemsList;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public String getRecieverName() {
		return recieverName;
	}

	public void setRecieverName(String recieverName) {
		this.recieverName = recieverName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public String getLogisticsId() {
		return logisticsId;
	}

	public void setLogisticsId(String logisticsId) {
		this.logisticsId = logisticsId;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", wechatId=" + wechatId + ", time=" + time + ", status=" + status + ", orderId="
				+ orderId + ", orderItemsList=" + orderItemsList + ", phoneNum=" + phoneNum + ", amount=" + amount
				+ ", totalCount=" + totalCount + ", recieverName=" + recieverName + ", address=" + address + ", openId="
				+ openId + "]";
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

}

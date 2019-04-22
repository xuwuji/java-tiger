package com.xuwuji.eshop.model;

import java.util.Date;
import java.util.List;

public class Order {

	private int id;
	private String wechatId;
	private Date time;
	/*
	 * {@Link} OrderStatus
	 */
	private String state;
	private String orderId;
	private List<OrderItem> orderItemsList;
	private String phoneNum;
	private double amount;
	private int totalCount;
	private String recieverName;
	private String address;
	private String openId;
	private String logisticsId;
	private String logisticsName;
	private String memo;
	private String source;
	private String sourceWechatId;
	private String sourceOpenId;
	private double bonusAmount;
	private String promotionIds;
	private String couponId;
	private double usedBonus;
	private double usedPoints;
	private double usedCouponCash;

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

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
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

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getLogisticsName() {
		return logisticsName;
	}

	public void setLogisticsName(String logisticsName) {
		this.logisticsName = logisticsName;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getSourceWechatId() {
		return sourceWechatId;
	}

	public void setSourceWechatId(String sourceWechatId) {
		this.sourceWechatId = sourceWechatId;
	}

	public String getSourceOpenId() {
		return sourceOpenId;
	}

	public void setSourceOpenId(String sourceOpenId) {
		this.sourceOpenId = sourceOpenId;
	}

	public double getBonusAmount() {
		return bonusAmount;
	}

	public void setBonusAmount(double bonusAmount) {
		this.bonusAmount = bonusAmount;
	}

	public String getPromotionIds() {
		return promotionIds;
	}

	public void setPromotionIds(String promotionIds) {
		this.promotionIds = promotionIds;
	}

	public String getCouponId() {
		return couponId;
	}

	public void setCouponId(String couponId) {
		this.couponId = couponId;
	}

	public double getUsedBonus() {
		return usedBonus;
	}

	public void setUsedBonus(double usedBonus) {
		this.usedBonus = usedBonus;
	}

	public double getUsedPoints() {
		return usedPoints;
	}

	public void setUsedPoints(double usedPoints) {
		this.usedPoints = usedPoints;
	}

	public double getUsedCouponCash() {
		return usedCouponCash;
	}

	public void setUsedCouponCash(double usedCouponCash) {
		this.usedCouponCash = usedCouponCash;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", wechatId=" + wechatId + ", time=" + time + ", state=" + state + ", orderId="
				+ orderId + ", orderItemsList=" + orderItemsList + ", phoneNum=" + phoneNum + ", amount=" + amount
				+ ", totalCount=" + totalCount + ", recieverName=" + recieverName + ", address=" + address + ", openId="
				+ openId + ", logisticsId=" + logisticsId + ", logisticsName=" + logisticsName + ", memo=" + memo
				+ ", source=" + source + ", sourceWechatId=" + sourceWechatId + ", sourceOpenId=" + sourceOpenId
				+ ", bonusAmount=" + bonusAmount + ", promotionIds=" + promotionIds + ", couponId=" + couponId
				+ ", usedBonus=" + usedBonus + ", usedPoints=" + usedPoints + ", usedCouponCash=" + usedCouponCash
				+ "]";
	}

}

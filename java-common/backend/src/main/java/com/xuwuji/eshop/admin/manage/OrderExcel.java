package com.xuwuji.eshop.admin.manage;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.alibaba.excel.ExcelWriter;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.metadata.BaseRowModel;
import com.alibaba.excel.metadata.Sheet;
import com.alibaba.excel.support.ExcelTypeEnum;
import com.xuwuji.eshop.db.dao.OrderDao;
import com.xuwuji.eshop.db.dao.OrderItemDao;
import com.xuwuji.eshop.model.Order;
import com.xuwuji.eshop.model.OrderItem;

public class OrderExcel extends BaseRowModel {

	@ExcelProperty(value = "id", index = 0)
	private int id;
	@ExcelProperty(value = "微信号", index = 1)
	private String wechatId;
	@ExcelProperty(value = "下单时间", index = 2)
	private Date time;
	/*
	 * {@Link} OrderStatus
	 */
	@ExcelProperty(value = "状态", index = 3)
	private String state;
	@ExcelProperty(value = "订单号", index = 4)
	private String orderId;
	@ExcelProperty(value = "手机号", index = 5)
	private String phoneNum;
	@ExcelProperty(value = "订单总额", index = 6)
	private double amount;
	@ExcelProperty(value = "商品件数", index = 7)
	private int totalCount;
	@ExcelProperty(value = "姓名", index = 8)
	private String recieverName;
	@ExcelProperty(value = "地址", index = 9)
	private String address;
	@ExcelProperty(value = "openId", index = 10)
	private String openId;
	@ExcelProperty(value = "物流单号", index = 11)
	private String logisticsId;
	@ExcelProperty(value = "物流公司", index = 12)
	private String logisticsName;
	@ExcelProperty(value = "订单备注", index = 13)
	private String memo;
	@ExcelProperty(value = "来源", index = 14)
	private String source;
	@ExcelProperty(value = "来源的微信号", index = 15)
	private String sourceWechatId;
	@ExcelProperty(value = "来源的openId", index = 16)
	private String sourceOpenId;
	@ExcelProperty(value = "参与促销的活动id", index = 17)
	private String promotionIds;
	@ExcelProperty(value = "使用的优惠券id", index = 18)
	private String couponId;
	@ExcelProperty(value = "使用的红包金额", index = 19)
	private double usedBonus;
	@ExcelProperty(value = "使用的积分", index = 20)
	private double usedPoints;
	@ExcelProperty(value = "使用的优惠券金额", index = 21)
	private double usedCouponCash;
	@ExcelProperty(value = "交易单号", index = 22)
	// 微信支付成功后生成的交易单号
	private String transactionId;
	@ExcelProperty(value = "统一支付单号", index = 23)
	// 调用统一支付后生成
	private String prepayId;
	@ExcelProperty(value = "模板id", index = 24)
	// 用于发送模板消息
	private String formId;
	@ExcelProperty(value = "商品信息", index = 25)
	private String orderItem;

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

	public String getLogisticsName() {
		return logisticsName;
	}

	public void setLogisticsName(String logisticsName) {
		this.logisticsName = logisticsName;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
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

	public String getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}

	public String getPrepayId() {
		return prepayId;
	}

	public void setPrepayId(String prepayId) {
		this.prepayId = prepayId;
	}

	public String getFormId() {
		return formId;
	}

	public void setFormId(String formId) {
		this.formId = formId;
	}

	public String getOrderItem() {
		return orderItem;
	}

	public void setOrderItem(String orderItem) {
		this.orderItem = orderItem;
	}

	public static void main(String[] args) throws FileNotFoundException {
		OrderDao orderDao = new OrderDao();
		OrderItemDao orderItemDao = new OrderItemDao();
		List<Order> orders = orderDao.getAll();
		List<OrderItem> itemList = new ArrayList<OrderItem>();
		OutputStream os = new FileOutputStream(new File("/Users/i509669/Documents/20190430.xlsx"));
		ExcelWriter writer = new ExcelWriter(os, ExcelTypeEnum.XLSX, true);
		Sheet sheet1 = new Sheet(1, 0, OrderExcel.class);
		List<OrderExcel> result = new ArrayList<OrderExcel>();
		for (Order order : orders) {
			itemList = orderItemDao.getByOrderId(order.getOrderId());
			for (OrderItem orderItem : itemList) {
				OrderExcel orderExcel = new OrderExcel();
				orderExcel.setOrderItem(
						orderItem.getName() + "；" + orderItem.getFormatName() + "；" + orderItem.getCount());
				orderExcel.setId(order.getId());
				orderExcel.setAddress(order.getAddress());
				orderExcel.setAmount(order.getAmount());
				orderExcel.setCouponId(order.getCouponId());
				orderExcel.setFormId(order.getFormId());
				orderExcel.setLogisticsId(order.getLogisticsId());
				orderExcel.setLogisticsName(order.getLogisticsName());
				orderExcel.setMemo(order.getMemo());
				orderExcel.setOpenId(order.getOpenId());
				orderExcel.setOrderId(order.getOrderId());
				orderExcel.setWechatId(order.getOrderId());
				orderExcel.setUsedPoints(order.getUsedPoints());
				orderExcel.setUsedCouponCash(order.getUsedCouponCash());
				orderExcel.setPhoneNum(order.getPhoneNum());
				orderExcel.setPrepayId(order.getPrepayId());
				orderExcel.setPromotionIds(order.getPromotionIds());
				String state = order.getState();
				if (state.equals("0")) {
					state = "待付款";
				} else if (state.equals("1")) {
					state = "已付款";
				} else if (state.equals("-1")) {
					state = "取消";
				} else if (state.equals("2")) {
					state = "已发货";
				} else if (state.equals("3")) {
					state = "已完成";
				}
				orderExcel.setState(state);
				orderExcel.setTime(order.getTime());
				orderExcel.setSource(order.getSource());
				orderExcel.setSourceWechatId(order.getSourceWechatId());
				orderExcel.setSourceOpenId(order.getSourceOpenId());
				orderExcel.setTransactionId(order.getTransactionId());
				result.add(orderExcel);
			}

		}
		writer.write(result, sheet1);
		writer.finish();
		System.out.println("数据已写出");
	}

}
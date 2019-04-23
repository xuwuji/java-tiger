package com.xuwuji.eshop.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.xuwuji.eshop.db.dao.OrderDao;
import com.xuwuji.eshop.db.dao.OrderItemDao;
import com.xuwuji.eshop.model.Order;
import com.xuwuji.eshop.model.OrderItem;
import com.xuwuji.eshop.model.template.TemplateConstants;
import com.xuwuji.eshop.model.template.TemplateData;
import com.xuwuji.eshop.model.template.WechatTemplate;
import com.xuwuji.eshop.util.HttpUtil;
import com.xuwuji.eshop.util.PayUtil;
import com.xuwuji.eshop.util.TimeUtil;
import com.xuwuji.eshop.util.TokenUtil;

/**
 * 发送模板消息的service
 * 
 * @author xuwuji
 *
 */
@Component
public class TemplateService {
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private OrderItemDao orderItemDao;

	private static final String BASE_URL = "https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send?access_token="
			+ TokenUtil.getAccessToken();

	/**
	 * 对待支付的订单进行提醒
	 * 
	 * 用提交订单时的得到formId做formId，只会发送一次
	 * 
	 * @throws JsonProcessingException
	 */
	public void handleWaitPay(Order order) throws JsonProcessingException {
		String orderId = order.getOrderId();
		List<OrderItem> items = orderItemDao.getByOrderId(orderId);
		String orderName = "";
		for (OrderItem item : items) {
			orderName = orderName + item.getName() + " ; ";
		}
		String openId = order.getOpenId();
		String amount = String.valueOf(order.getAmount());
		String orderDate = String.valueOf(TimeUtil.dateToFormatString(order.getTime()));
		String tip = "您有一笔订单未支付，请尽快支付，超时将自动关闭，若已支付，请忽略；如需使用支付宝或花呗付款，请询问客服";
		// 构造模板消息
		WechatTemplate WechatTemplate = new WechatTemplate();
		WechatTemplate.setForm_id(order.getFormId());
		WechatTemplate.setTemplate_id(TemplateConstants.WAIT_PAY_TEMPLATEID);
		WechatTemplate.setTouser(openId);
		WechatTemplate.setPage("pages/orderDetail/orderDetail?orderStatus=0");
		Map<String, TemplateData> data = new HashMap<>(5);
		TemplateData templateData1 = new TemplateData();
		templateData1.setValue(orderId);
		data.put(TemplateConstants.KEYWORD1, templateData1);
		TemplateData templateData2 = new TemplateData();
		templateData2.setValue(orderName);
		data.put(TemplateConstants.KEYWORD2, templateData2);
		TemplateData templateData3 = new TemplateData();
		templateData3.setValue(amount);
		data.put(TemplateConstants.KEYWORD3, templateData3);
		TemplateData templateData4 = new TemplateData();
		templateData4.setValue(orderDate);
		data.put(TemplateConstants.KEYWORD4, templateData4);
		TemplateData templateData5 = new TemplateData();
		templateData5.setValue(tip);
		data.put(TemplateConstants.KEYWORD5, templateData5);
		WechatTemplate.setData(data);
		// 向微信后端发送消息
		ObjectMapper mapper = new ObjectMapper();
		String payload = mapper.writeValueAsString(WechatTemplate);
		System.out.println(payload);
		String result=PayUtil.httpRequest(BASE_URL, "POST", payload);
		System.out.println(result);
	}

	/**
	 * 对已支付成功的订单进行提醒
	 * 
	 * 用统一支付得到的prepay_id当做formId
	 * 
	 * @throws JsonProcessingException
	 */
	public void handlePayed(Order order) throws JsonProcessingException {
		String orderId = order.getOrderId();
		List<OrderItem> items = orderItemDao.getByOrderId(orderId);
		String orderName = "";
		for (OrderItem item : items) {
			orderName = orderName + item.getName() + " ; ";
		}
		String openId = order.getOpenId();
		String amount = String.valueOf(order.getAmount());
		String tip = "您可以在小程序中查看物流信息";
		// 构造模板消息
		WechatTemplate WechatTemplate = new WechatTemplate();
		WechatTemplate.setForm_id(order.getPrepayId());
		WechatTemplate.setTemplate_id(TemplateConstants.PAYED_TEMPLATEID);
		WechatTemplate.setTouser(openId);
		WechatTemplate.setPage("pages/orderDetail/orderDetail?orderStatus=1");
		Map<String, TemplateData> data = new HashMap<>(5);
		TemplateData templateData1 = new TemplateData();
		templateData1.setValue(orderId);
		data.put(TemplateConstants.KEYWORD1, templateData1);
		TemplateData templateData2 = new TemplateData();
		templateData2.setValue(orderName);
		data.put(TemplateConstants.KEYWORD2, templateData2);
		TemplateData templateData3 = new TemplateData();
		templateData3.setValue(amount);
		data.put(TemplateConstants.KEYWORD3, templateData3);
		TemplateData templateData4 = new TemplateData();
		templateData4.setValue(tip);
		data.put(TemplateConstants.KEYWORD4, templateData4);
		WechatTemplate.setData(data);
		// 向微信后端发送消息
		ObjectMapper mapper = new ObjectMapper();
		String payload = mapper.writeValueAsString(WechatTemplate);
		System.out.println(payload);
		PayUtil.httpRequest(BASE_URL, "POST", payload);
	}

}

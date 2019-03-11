package com.xuwuji.eshop.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.xuwuji.eshop.db.dao.OrderDao;
import com.xuwuji.eshop.db.dao.OrderItemDao;
import com.xuwuji.eshop.model.Order;
import com.xuwuji.eshop.model.OrderItem;
import com.xuwuji.eshop.util.ToolUtil;

@Controller
@RequestMapping(value = "/order")
public class OrderController {

	@Autowired
	private OrderDao orderDao;

	@Autowired
	private OrderItemDao orderItemDao;

	@Autowired
	private ToolUtil toolUtil;

	@RequestMapping(value = "/submitOrder", method = RequestMethod.POST)
	@ResponseBody
	public Order submitOrder(@RequestBody String orderJsonStr)
			throws JsonParseException, JsonMappingException, IOException {
		System.out.println(orderJsonStr);
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(orderJsonStr);
		JsonNode orderNode = mapper.readTree(rootNode.iterator().next().asText());
		Order order = new Order();
		order.setWechatId(orderNode.get("wechatId").asText());
		order.setPhoneNum(orderNode.get("phoneNum").asText());
		JsonNode orderItemsListNode = orderNode.get("orderItemsList");
		List<OrderItem> orderItemsList = new ArrayList<OrderItem>();
		String orderId = toolUtil.getOrderId();
		for (int i = 0; i < orderItemsListNode.size(); i++) {
			OrderItem item = new OrderItem();
			item.setCount(orderItemsListNode.get(i).path("count").asInt());
			item.setFormatId(orderItemsListNode.get(i).path("formatId").asText());
			item.setName(orderItemsListNode.get(i).path("name").asText());
			item.setOrderId(orderId);
			item.setFormatName(orderItemsListNode.get(i).path("formatName").asText());
			item.setProductId(orderItemsListNode.get(i).path("productId").asText());
			item.setMainImgUrl(orderItemsListNode.get(i).path("mainImgUrl").asText());
			item.setPrice(orderItemsListNode.get(i).path("price").asDouble());
			orderItemsList.add(item);
			orderItemDao.add(item);
		}
		order.setAmount(orderNode.get("amount").asDouble());
		order.setTotalCount(orderNode.get("totalCount").asInt());
		order.setAddress(orderNode.get("address").asText());
		order.setRecieverName(orderNode.get("recieverName").asText());
		order.setOpenId(orderNode.get("openId").asText());
		order.setMemo(orderNode.get("memo").asText());
		order.setTime(new Date());
		order.setOrderId(orderId);
		order = orderDao.add(order);
		order.setOrderItemsList(orderItemsList);
		System.out.println(order.toString());
		return order;
	}

	@RequestMapping(value = "/getOrderInfoByOrderId/{orderId}", method = RequestMethod.GET)
	@ResponseBody
	public List<Order> getOrderInfoByOrderId(@PathVariable("orderId") String orderId, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("getOrderInfoByOrderId");
		List<Order> orders = new ArrayList<Order>();
		Order order = new Order();
		order = orderDao.getOrderInfoByOrderId(orderId);
		List<OrderItem> orderItemsList = new ArrayList<OrderItem>();
		orderItemsList = orderItemDao.getByOrderId(orderId);
		order.setOrderItemsList(orderItemsList);
		orders.add(order);
		return orders;
	}

	@RequestMapping(value = "/getOrderInfoByUserAndStatus", method = RequestMethod.GET)
	@ResponseBody
	public List<Order> getOrderInfoByUserAndStatus(@RequestParam("openId") String openId,
			@RequestParam("orderState") String orderState, HttpServletRequest request, HttpServletResponse response) {
		List<Order> orders = new ArrayList<Order>();
		orders = orderDao.getAllByOpenIdAndStatus(openId, orderState);
		for (Order order : orders) {
			String orderId = order.getOrderId();
			List<OrderItem> orderItemsList = new ArrayList<OrderItem>();
			orderItemsList = orderItemDao.getByOrderId(orderId);
			order.setOrderItemsList(orderItemsList);
		}
		return orders;
	}

}

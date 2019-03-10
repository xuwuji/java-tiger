package com.xuwuji.eshop.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
			item.setProductId(orderItemsListNode.get(i).path("productId").asText());
			item.setPrice(orderItemsListNode.get(i).path("price").asDouble());
			orderItemsList.add(item);
			orderItemDao.add(item);
		}
		order.setAmount(orderNode.get("amount").asDouble());
		order.setTotalCount(orderNode.get("totalCount").asInt());
		order.setAddress(orderNode.get("address").asText());
		order.setRecieverName(orderNode.get("recieverName").asText());
		order.setOpenId(orderNode.get("openId").asText());
		order.setOrderItemsList(orderItemsList);
		order.setTime(new Date());
		order.setOrderId(orderId);
		order = orderDao.add(order);
		System.out.println(order.toString());
		return order;
	}

	@RequestMapping(value = "/getOrderInfoById/{id}", method = RequestMethod.GET)
	@ResponseBody
	public List<Order> getOrderInfoById(@PathVariable("id") String id, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("getOrderInfoById");
		ArrayList<Order> orders = new ArrayList<Order>();
		List<OrderItem> orderItemsList = new ArrayList<OrderItem>();
		OrderItem item = new OrderItem();
		item.setCount(10);
		item.setName("channel");
		item.setMainImgUrl("http://i1.bvimg.com/677237/ac5d93a8cd171dfe.jpg");
		item.setId(20);
		item.setOrderId("23124124124");
		OrderItem item2 = new OrderItem();
		item2.setCount(30);
		item2.setName("channel");
		item2.setMainImgUrl("http://i1.bvimg.com/677237/4919e3469f3e4e6b.jpg");
		item2.setId(30);
		item2.setOrderId("23124124124");
		orderItemsList.add(item);
		orderItemsList.add(item2);
		Order order = new Order();
		order.setAddress("dasd");
		order.setStatus("0");
		order.setAmount(100);
		order.setOrderId("23124124124");
		order.setTime(new Date());
		order.setOrderItemsList(orderItemsList);
		order.setTime(new Date());
		orders.add(order);
		return orders;
	}

	@RequestMapping(value = "/getOrderInfoByUserAndStatus", method = RequestMethod.GET)
	@ResponseBody
	public List<Order> getOrderInfoByUserAndStatus(@RequestParam("openId") String openId,
			@RequestParam("orderStatus") String orderStatus, HttpServletRequest request, HttpServletResponse response) {
		ArrayList<Order> orders = new ArrayList<Order>();
		// String openId = (String) request.getAttribute("openId");
		// String orderStatus = (String) request.getAttribute("orderStatus");
		if (orderStatus == null || orderStatus.isEmpty()) {
			orderStatus = "0";
		}
		List<OrderItem> orderItemsList = new ArrayList<OrderItem>();
		OrderItem item = new OrderItem();
		item.setCount(10);
		item.setName("channel");
		item.setMainImgUrl("http://i1.bvimg.com/677237/ac5d93a8cd171dfe.jpg");
		item.setId(20);
		item.setOrderId("23124124124");
		OrderItem item2 = new OrderItem();
		item2.setCount(30);
		item2.setName("channel");
		item2.setMainImgUrl("http://i1.bvimg.com/677237/4919e3469f3e4e6b.jpg");
		item2.setId(30);
		item2.setOrderId("23124124124");
		orderItemsList.add(item);
		orderItemsList.add(item2);
		Order order = new Order();
		order.setAddress("dasd");
		order.setStatus("0");
		order.setAmount(100);
		order.setOrderId("23124124124");
		order.setTime(new Date());
		order.setOrderItemsList(orderItemsList);
		orders.add(order);
		orders.add(order);
		order.setTime(new Date());
		orders.add(order);

		orders.add(order);
		Order order2 = new Order();

		Date a = new Date();
		a.setYear(2020);
		order2.setTime(a);
		orders.add(order2);
		order.setTime(new Date());
		orders.add(order);
		order.setTime(new Date());
		orders.add(order);
		order.setTime(new Date());
		orders.add(order);
		orders.add(order);
		orders.add(order);
		orders.add(order);
		if (orderStatus.equals("1")) {
			orders = new ArrayList<Order>();
		}
		if (orderStatus.equals("2")) {
			order.setStatus("2");
			order.setLogisticsId("888882131241");
			orders.add(order);
		}
		return orders;
	}
}

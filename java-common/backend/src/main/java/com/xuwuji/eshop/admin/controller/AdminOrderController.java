package com.xuwuji.eshop.admin.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xuwuji.eshop.db.dao.OrderDao;
import com.xuwuji.eshop.db.dao.OrderItemDao;
import com.xuwuji.eshop.db.dao.UserDao;
import com.xuwuji.eshop.model.Category;
import com.xuwuji.eshop.model.Img;
import com.xuwuji.eshop.model.Order;
import com.xuwuji.eshop.model.ParentCategory;
import com.xuwuji.eshop.model.User;
import com.xuwuji.eshop.util.EshopConfigUtil;

/**
 * product����
 * 
 * @author xuwuji
 *
 */
@Controller
@RequestMapping(value = "/admin/order")
public class AdminOrderController {

	@Autowired
	private OrderDao orderDao;

	@Autowired
	private OrderItemDao orderItemDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private EshopConfigUtil eshopConfigUtil;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("/eshop/order");
	}

	@RequestMapping(value = "/finish", method = RequestMethod.POST)
	@ResponseBody
	public void delete(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		// ����ɾ��
		if (type.equals("single")) {

		}
		// ����ɾ��
		else if (type.equals("batch")) {
			List<String> ids = Arrays.asList(id.split(","));
			System.out.println(ids);
		}
		System.out.println(id);
	}

	@RequestMapping(value = "/deliver", method = RequestMethod.POST)
	@ResponseBody
	public void deliver(HttpServletRequest request, HttpServletResponse response) {
		String orderId = request.getParameter("orderId");
		String logisticsId = request.getParameter("logisticsId");
		String logisticsName = request.getParameter("logisticsName");
		System.out.println(orderId);
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public void update(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("admin/update");
		String orderId = request.getParameter("orderId");
		System.out.println(orderId);
		String state = request.getParameter("state");
		System.out.println(state);
		String logisticsId = request.getParameter("logisticsId");
		System.out.println(logisticsId);
		String logisticsName = request.getParameter("logisticsName");
		System.out.println(logisticsName);
		String memo = request.getParameter("memo");
		System.out.println(memo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("orderId", orderId);
		map.put("state", state);
		map.put("logisticsId", logisticsId);
		map.put("logisticsName", logisticsName);
		map.put("memo", memo);
		orderDao.update(map);
	}

	@RequestMapping(value = "/pay", method = RequestMethod.POST)
	@ResponseBody
	public void pay(HttpServletRequest request, HttpServletResponse response) {
		String orderId = request.getParameter("orderId");
		String state = request.getParameter("state");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("orderId", orderId);
		map.put("state", state);
		orderDao.update(map);
		// user related
		Order order = orderDao.getOrderInfoByOrderId(orderId);
		String openId = order.getOpenId();
		String source = order.getSource();
		User buyer = new User();
		buyer.setOpenId(openId);
		// buyer=> new user
		if (userDao.getByCondition(buyer).getId() == 0) {
			// bonus
			if (source.equals("share")) {
				String sourceOpenId = order.getSourceOpenId();
				User resourcer = new User();
				resourcer.setOpenId(sourceOpenId);
				resourcer = userDao.getByCondition(resourcer);
				resourcer.setBonusAmount(
						resourcer.getBonusAmount() + Double.valueOf(eshopConfigUtil.getParam(eshopConfigUtil.BONUS)));
				userDao.update(resourcer);
			}
			// buyer => old
			userDao.add(buyer);
		}
	}

}

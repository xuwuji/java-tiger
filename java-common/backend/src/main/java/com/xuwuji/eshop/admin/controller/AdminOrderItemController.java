package com.xuwuji.eshop.admin.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jboss.netty.util.internal.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xuwuji.eshop.db.dao.OrderDao;
import com.xuwuji.eshop.db.dao.OrderItemDao;
import com.xuwuji.eshop.model.Category;
import com.xuwuji.eshop.model.Format;
import com.xuwuji.eshop.model.Img;
import com.xuwuji.eshop.model.Order;
import com.xuwuji.eshop.model.OrderItem;
import com.xuwuji.eshop.model.ParentCategory;

/**
 * productπ‹¿Ì
 * 
 * @author xuwuji
 *
 */
@Controller
@RequestMapping(value = "/admin/orderItem")
public class AdminOrderItemController {

	@Autowired
	private OrderDao orderDao;

	@Autowired
	private OrderItemDao orderItemDao;

	@RequestMapping(value = "/index/{orderId}", method = RequestMethod.GET)
	public ModelAndView index(@PathVariable("orderId") String orderId, HttpServletRequest request,
			HttpServletResponse response) {
		Order order = orderDao.getOrderInfoByOrderId(orderId);
		order.setOrderItemsList(orderItemDao.getByOrderId(orderId));
		ModelAndView mv = new ModelAndView("eshop/orderItem").addObject("order", order);
		mv.addObject("orderId", orderId);
		return mv;
	}

	@RequestMapping(value = "/getAllByOrderId/{orderId}", method = RequestMethod.GET)
	@ResponseBody
	public List<OrderItem> getAllByProductId(@PathVariable("orderId") String orderId, HttpServletRequest request,
			HttpServletResponse response) {
		return orderItemDao.getByOrderId(orderId);
	}

}

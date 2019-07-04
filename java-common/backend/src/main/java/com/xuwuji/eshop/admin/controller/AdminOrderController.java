package com.xuwuji.eshop.admin.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.xuwuji.eshop.admin.service.TemplateService;
import com.xuwuji.eshop.db.dao.OrderDao;
import com.xuwuji.eshop.db.dao.OrderItemDao;
import com.xuwuji.eshop.db.dao.ProductDao;
import com.xuwuji.eshop.db.dao.UserDao;
import com.xuwuji.eshop.model.Category;
import com.xuwuji.eshop.model.Img;
import com.xuwuji.eshop.model.Order;
import com.xuwuji.eshop.model.OrderItem;
import com.xuwuji.eshop.model.OrderStatus;
import com.xuwuji.eshop.model.ParentCategory;
import com.xuwuji.eshop.model.Product;
import com.xuwuji.eshop.model.User;
import com.xuwuji.eshop.model.UserLevel;
import com.xuwuji.eshop.model.UserState;
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
	private ProductDao productDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private EshopConfigUtil eshopConfigUtil;

	@Autowired
	private TemplateService templateService;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("/eshop/order");
	}

	@RequestMapping(value = "/indexAll", method = RequestMethod.GET)
	public ModelAndView indexAll(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("/eshop/orderAll");
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
	public void update(HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
		String orderId = request.getParameter("orderId");
		String state = request.getParameter("state");
		String logisticsId = request.getParameter("logisticsId");
		String logisticsName = request.getParameter("logisticsName");
		String memo = request.getParameter("memo");
		Order order = new Order();
		order.setOrderId(orderId);
		order.setState(state);
		order.setLogisticsId(logisticsId);
		order.setLogisticsName(logisticsName);
		order.setMemo(memo);
		orderDao.update(order);
		if (state.equals(OrderStatus.DELIVERED.getCode())) {
			templateService.handleDelivered(orderId);
		}
	}

	/**
	 * 不使用微信支付时，需要人工点付款时调用此接口
	 * 
	 * @param request
	 * @param response
	 * @throws JsonProcessingException
	 */
	@RequestMapping(value = "/pay", method = RequestMethod.POST)
	@ResponseBody
	public void pay(HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
		String orderId = request.getParameter("orderId");
		String state = request.getParameter("state");
		Order updateOrder = new Order();
		updateOrder.setState(state);
		updateOrder.setOrderId(orderId);
		orderDao.update(updateOrder);
		// user related
		Order order = orderDao.getOrderInfoByOrderId(orderId);
		templateService.handlePayed(order);
		String openId = order.getOpenId();
		String source = order.getSource();
		User buyer = new User();
		buyer.setOpenId(openId);
		User userFromDB = userDao.getByCondition(buyer);
		// 对于没有存储的新用户和没付过款的用户，进行拉新判断
		if (userFromDB.getId() == 0 || userFromDB.getState().equals("")
				|| userFromDB.getState().equals(UserState.NEW.getCode())) {
			// 如果此订单是通过分享进行下单的，则对分享人进行红包奖励
			if (source.equals("share")) {
				String sourceOpenId = order.getSourceOpenId();
				User resourcer = new User();
				resourcer.setOpenId(sourceOpenId);
				resourcer = userDao.getByCondition(resourcer);
				// 分享人必须是付过款的老用户才可以得到红包
				if (resourcer.getState() != null && resourcer.getState().equals(UserState.PAID.getCode())) {
					resourcer.setBonusAmount(resourcer.getBonusAmount()
							+ Double.valueOf(eshopConfigUtil.getParam(eshopConfigUtil.BONUS)));
					userDao.update(resourcer);
				}
			}
			// 如果表里没储存过这个用户，需要添加到表里
			buyer.setState(UserState.PAID.getCode());
			if (userFromDB.getId() == 0 || userFromDB.getState().equals("")) {
				userDao.add(buyer);
			}

		}
		// 对买家进行信息更新
		User updateUser = userDao.getByCondition(buyer);
		updateUser.setState(UserState.PAID.getCode());
		// 更新本月消费信息，每个月最后一天这个字段进行归档，所以此处可以直接添加
		double amountThisMonth = updateUser.getAmountThisMonth() + order.getAmount();
		updateUser.setAmountThisMonth(amountThisMonth);
		// 根据累积付款，更新级别
		double totalPay = updateUser.getTotalPay() + order.getAmount();
		updateUser.setTotalPay(totalPay);
		if (totalPay < 3000) {
			updateUser.setLevel(UserLevel.NORMAL.getCode());
		} else if (totalPay >= 3000 && totalPay < 8000) {
			updateUser.setLevel(UserLevel.GOLD.getCode());
			if (updateUser.getMembershipFirstDay() == null) {
				updateUser.setMembershipFirstDay(new Date());
			}
		} else if (totalPay >= 8000 && totalPay < 20000) {
			updateUser.setLevel(UserLevel.PLATINUM.getCode());
			if (updateUser.getMembershipFirstDay() == null) {
				updateUser.setMembershipFirstDay(new Date());
			}
		} else if (totalPay >= 20000) {
			updateUser.setLevel(UserLevel.DIAMOND.getCode());
			if (updateUser.getMembershipFirstDay() == null) {
				updateUser.setMembershipFirstDay(new Date());
			}
		}
		// 在用户确认收货后，才将积分进行发放
		// updateUser.setPoints(updateUser.getPoints() + (int) (order.getAmount()));
		userDao.update(updateUser);
		// 付款后更新库存和销量
		List<OrderItem> orderItems = orderItemDao.getByOrderId(orderId);
		for (OrderItem orderItem : orderItems) {
			Product product = productDao.getById(orderItem.getProductId());
			product.setSalesCount(product.getSalesCount() + orderItem.getCount());
			product.setInventory(product.getInventory() - orderItem.getCount());
			productDao.update(product);
		}
	}

}

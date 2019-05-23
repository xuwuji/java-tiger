package com.xuwuji.eshop.admin.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.dao.OrderDao;
import com.xuwuji.eshop.db.dao.OrderItemDao;
import com.xuwuji.eshop.db.dao.ProductDao;
import com.xuwuji.eshop.db.dao.UserDao;
import com.xuwuji.eshop.model.Order;
import com.xuwuji.eshop.model.OrderItem;
import com.xuwuji.eshop.model.Product;
import com.xuwuji.eshop.model.User;
import com.xuwuji.eshop.model.UserLevel;
import com.xuwuji.eshop.model.UserState;
import com.xuwuji.eshop.util.EshopConfigUtil;

/**
 * 处理支付相关业务(系统内部)
 * 
 * @author xuwuji
 *
 */
@Component
public class PayService {
	@Autowired
	private OrderDao orderDao;

	@Autowired
	private OrderItemDao orderItemDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private ProductDao productDao;

	@Autowired
	private EshopConfigUtil eshopConfigUtil;

	public void pay(String orderId) {
		// user related
		Order order = orderDao.getOrderInfoByOrderId(orderId);
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
		// userDao.update(updateUser);
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

package com.xuwuji.eshop.db.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.mapper.OrderMapper;
import com.xuwuji.eshop.db.util.SessionFactory;
import com.xuwuji.eshop.model.Order;

@Component
public class OrderDao {

	public Order add(Order order) {
		SqlSession session = SessionFactory.openDEVSession();
		Order orderResult = new Order();
		try {
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("time", order.getTime());
			map.put("status", order.getStatus());
			map.put("wechatId", order.getWechatId());
			map.put("orderId", order.getOrderId());
			map.put("phoneNum", order.getPhoneNum());
			map.put("address", order.getAddress());
			map.put("amount", order.getAmount());
			map.put("totalCount", order.getTotalCount());
			map.put("recieverName", order.getRecieverName());
			map.put("openId", order.getOpenId());
			orderResult = mapper.add(map);
			session.commit();
			return orderResult;
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return orderResult;
	}

	public List<Order> getAllByWechatIdAndStatus(String wechatId, String status) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Order> result = new ArrayList<Order>();
		try {
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("wechatId", wechatId);
			map.put("status", status);
			result = mapper.getAllByWechatIdAndStatus(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public List<Order> getAllByOpenIdAndStatus(String openId, String status) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Order> result = new ArrayList<Order>();
		try {
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("openId", openId);
			map.put("status", status);
			result = mapper.getAllByOpenIdAndStatus(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

}

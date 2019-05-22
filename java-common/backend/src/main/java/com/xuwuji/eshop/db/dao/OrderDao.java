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
		try {
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			mapper.add(order);
			session.commit();
			return order;
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return order;
	}

	public void update(Order order) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("logisticsId", order.getLogisticsId());
			map.put("logisticsName", order.getLogisticsName());
			map.put("memo", order.getMemo());
			map.put("state", order.getState());
			map.put("orderId", order.getOrderId());
			mapper.update(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public void updateState(String orderId, String state) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("state", state);
			map.put("orderId", orderId);
			mapper.updateState(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}
	
	public void updateBalanceAmount(String orderId, double balanceAmount) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("balanceAmount", balanceAmount);
			map.put("orderId", orderId);
			mapper.updateBalanceAmount(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public void updateTransactionId(String orderId, String transactionId) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("transactionId", transactionId);
			map.put("orderId", orderId);
			mapper.updateTransactionId(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public void updatePrepayId(String orderId, String prepayId) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("prepayId", prepayId);
			map.put("orderId", orderId);
			mapper.updatePrepayId(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public List<Order> getAllByWechatIdAndStatus(String wechatId, String state) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Order> result = new ArrayList<Order>();
		try {
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("wechatId", wechatId);
			map.put("state", state);
			result = mapper.getAllByWechatIdAndState(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public List<Order> getAllByOpenIdAndStatus(String openId, String state) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Order> result = new ArrayList<Order>();
		try {
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("openId", openId);
			map.put("state", state);
			result = mapper.getAllByOpenIdAndState(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public List<Order> getAllByOpenId(String openId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Order> result = new ArrayList<Order>();
		try {
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("openId", openId);
			result = mapper.getAllByOpenId(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public List<Order> getAll() {
		SqlSession session = SessionFactory.openDEVSession();
		List<Order> result = new ArrayList<Order>();
		try {
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			result = mapper.getAll();
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public Order getOrderInfoByOrderId(String orderId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Order> result = new ArrayList<Order>();
		try {
			OrderMapper mapper = session.getMapper(OrderMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("orderId", orderId);
			result = mapper.getOrderInfoByOrderId(map);
			session.commit();
			return result.get(0);
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result.get(0);
	}

}

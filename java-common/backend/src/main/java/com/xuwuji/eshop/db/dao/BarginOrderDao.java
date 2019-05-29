package com.xuwuji.eshop.db.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.mapper.BarginOrderMapper;
import com.xuwuji.eshop.db.util.SessionFactory;
import com.xuwuji.eshop.model.BarginOrder;

@Component
public class BarginOrderDao {

	public void add(BarginOrder barginOrder) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			BarginOrderMapper mapper = session.getMapper(BarginOrderMapper.class);
			mapper.add(barginOrder);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public BarginOrder getById(String id) {
		SqlSession session = SessionFactory.openDEVSession();
		List<BarginOrder> result = new ArrayList<BarginOrder>();
		try {
			BarginOrderMapper mapper = session.getMapper(BarginOrderMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			result = mapper.getById(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		if (result.size() == 1) {
			return result.get(0);
		} else {
			return null;
		}
	}

	public List<BarginOrder> getByOpenId(String openId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<BarginOrder> result = new ArrayList<BarginOrder>();
		try {
			BarginOrderMapper mapper = session.getMapper(BarginOrderMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("openId", openId);
			result = mapper.getByOpenId(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public List<BarginOrder> getByOpenIdAndState(String openId, String state) {
		SqlSession session = SessionFactory.openDEVSession();
		List<BarginOrder> result = new ArrayList<BarginOrder>();
		try {
			BarginOrderMapper mapper = session.getMapper(BarginOrderMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("openId", openId);
			map.put("state", state);
			result = mapper.getByOpenIdAndState(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public BarginOrder getByBarginOrderId(String barginOrderId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<BarginOrder> result = new ArrayList<BarginOrder>();
		try {
			BarginOrderMapper mapper = session.getMapper(BarginOrderMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("barginOrderId", barginOrderId);
			result = mapper.getByBarginOrderId(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		if (result.size() == 1) {
			return result.get(0);
		} else {
			return null;
		}
	}

	public List<BarginOrder> isJoined(String openId, String barginItemId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<BarginOrder> result = new ArrayList<BarginOrder>();
		try {
			BarginOrderMapper mapper = session.getMapper(BarginOrderMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("openId", openId);
			map.put("barginItemId", barginItemId);
			result = mapper.isJoined(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public void update(BarginOrder barginOrder) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			BarginOrderMapper mapper = session.getMapper(BarginOrderMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("people", barginOrder.getPeople());
			map.put("state", barginOrder.getState());
			map.put("barginOrderId", barginOrder.getBarginOrderId());
			mapper.update(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public void updateState(String barginOrderId, String state) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			BarginOrderMapper mapper = session.getMapper(BarginOrderMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("state", state);
			map.put("barginOrderId", barginOrderId);
			mapper.updateState(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}
}

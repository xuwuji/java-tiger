package com.xuwuji.eshop.db.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.mapper.BarginOrderHistoryMapper;
import com.xuwuji.eshop.db.util.SessionFactory;
import com.xuwuji.eshop.model.BarginOrderHistory;

@Component
public class BarginOrderHistoryDao {

	public void add(BarginOrderHistory barginOrderHistory) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			BarginOrderHistoryMapper mapper = session.getMapper(BarginOrderHistoryMapper.class);
			mapper.add(barginOrderHistory);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public List<BarginOrderHistory> getByBarginOrderId(String barginOrderId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<BarginOrderHistory> result = new ArrayList<BarginOrderHistory>();
		try {
			BarginOrderHistoryMapper mapper = session.getMapper(BarginOrderHistoryMapper.class);
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
		return result;
	}

	public boolean checkExist(String sourceUser, String openUser, String barginOrderId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<BarginOrderHistory> result = new ArrayList<BarginOrderHistory>();
		try {
			BarginOrderHistoryMapper mapper = session.getMapper(BarginOrderHistoryMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("barginOrderId", barginOrderId);
			map.put("sourceUser", sourceUser);
			map.put("openUser", openUser);
			result = mapper.getByBarginOrderId(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		if (result.size() != 0) {
			return true;
		} else {
			return false;
		}
	}

}

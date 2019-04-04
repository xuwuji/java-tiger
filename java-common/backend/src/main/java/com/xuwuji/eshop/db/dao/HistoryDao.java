package com.xuwuji.eshop.db.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.mapper.HistoryMapper;
import com.xuwuji.eshop.db.util.SessionFactory;
import com.xuwuji.eshop.model.History;

@Component
public class HistoryDao {

	public void add(History history) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			HistoryMapper mapper = session.getMapper(HistoryMapper.class);
			mapper.add(history);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public List<History> getAllByOpenId(String openId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<History> result = new ArrayList<History>();
		try {
			HistoryMapper mapper = session.getMapper(HistoryMapper.class);
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

}

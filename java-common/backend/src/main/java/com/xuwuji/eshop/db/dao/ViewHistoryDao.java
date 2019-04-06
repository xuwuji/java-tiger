package com.xuwuji.eshop.db.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.mapper.ViewHistoryMapper;
import com.xuwuji.eshop.db.util.SessionFactory;
import com.xuwuji.eshop.model.ViewHistory;

@Component
public class ViewHistoryDao {

	public void add(ViewHistory history) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			ViewHistoryMapper mapper = session.getMapper(ViewHistoryMapper.class);
			mapper.add(history);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public List<ViewHistory> getAllByOpenId(String openId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<ViewHistory> result = new ArrayList<ViewHistory>();
		try {
			ViewHistoryMapper mapper = session.getMapper(ViewHistoryMapper.class);
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

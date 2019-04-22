package com.xuwuji.eshop.db.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.mapper.SearchHistoryMapper;
import com.xuwuji.eshop.db.util.SessionFactory;
import com.xuwuji.eshop.model.SearchHistory;

@Component
public class SearchHistoryDao {

	public void add(SearchHistory history) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			SearchHistoryMapper mapper = session.getMapper(SearchHistoryMapper.class);
			mapper.add(history);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public List<SearchHistory> getAllByOpenId(String openId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<SearchHistory> result = new ArrayList<SearchHistory>();
		try {
			SearchHistoryMapper mapper = session.getMapper(SearchHistoryMapper.class);
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

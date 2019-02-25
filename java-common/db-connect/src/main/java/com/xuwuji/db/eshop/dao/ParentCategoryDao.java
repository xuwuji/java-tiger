package com.xuwuji.db.eshop.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.xuwuji.db.mapper.MetaMapper;
import com.xuwuji.db.util.SessionFactory;

public class ParentCategoryDao {

	public void add(String name) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			MetaMapper mapper = session.getMapper(MetaMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("name", name);
			mapper.insert(map);
			session.commit();
		} catch (Exception e) {
			session.rollback();
		} finally {
			session.close();
		}
	}
	
	
}

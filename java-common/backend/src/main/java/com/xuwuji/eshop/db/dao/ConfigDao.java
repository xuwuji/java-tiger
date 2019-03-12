package com.xuwuji.eshop.db.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.mapper.ConfigMapper;
import com.xuwuji.eshop.db.util.SessionFactory;
import com.xuwuji.eshop.model.Config;

@Component
public class ConfigDao {

	public void add(Config config) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			ConfigMapper mapper = session.getMapper(ConfigMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("name", config.getName());
			map.put("value", config.getValue());
			mapper.addParam(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public void update(Config config) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			ConfigMapper mapper = session.getMapper(ConfigMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("name", config.getName());
			map.put("value", config.getValue());
			map.put("id", config.getId());
			mapper.update(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public List<Config> getAll() {
		SqlSession session = SessionFactory.openDEVSession();
		List<Config> result = new ArrayList<Config>();
		try {
			ConfigMapper mapper = session.getMapper(ConfigMapper.class);
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

}

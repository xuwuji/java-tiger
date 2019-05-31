package com.xuwuji.eshop.db.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.mapper.ParentCategoryMapper;
import com.xuwuji.eshop.db.util.SessionFactory;
import com.xuwuji.eshop.model.ParentCategory;

@Component
public class ParentCategoryDao {

	public void add(String name) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			ParentCategoryMapper mapper = session.getMapper(ParentCategoryMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("name", name);
			mapper.add(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public void disable(String id) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			ParentCategoryMapper mapper = session.getMapper(ParentCategoryMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			mapper.disable(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	};

	public void reActive(String id) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			ParentCategoryMapper mapper = session.getMapper(ParentCategoryMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			mapper.reActive(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	};

	public List<ParentCategory> getAll() {
		SqlSession session = SessionFactory.openDEVSession();
		List<ParentCategory> result = new ArrayList<ParentCategory>();
		try {
			ParentCategoryMapper mapper = session.getMapper(ParentCategoryMapper.class);
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

	public List<ParentCategory> getActiveAll() {
		SqlSession session = SessionFactory.openDEVSession();
		List<ParentCategory> result = new ArrayList<ParentCategory>();
		try {
			ParentCategoryMapper mapper = session.getMapper(ParentCategoryMapper.class);
			result = mapper.getActiveAll();
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public void update(String id, String name) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			ParentCategoryMapper mapper = session.getMapper(ParentCategoryMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("name", name);
			mapper.update(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}

	}

}

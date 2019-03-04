package com.xuwuji.eshop.db.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.mapper.CategoryMapper;
import com.xuwuji.eshop.db.util.SessionFactory;
import com.xuwuji.eshop.model.Category;

@Component
public class CategoryDao {

	public void add(Category category) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			CategoryMapper mapper = session.getMapper(CategoryMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("name", category.getName());
			map.put("description", category.getDescription());
			map.put("parentCategoryId", category.getParentCategoryId());
			map.put("imgUrl", category.getImgUrl());
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
			CategoryMapper mapper = session.getMapper(CategoryMapper.class);
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
			CategoryMapper mapper = session.getMapper(CategoryMapper.class);
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

	public void update(Category category) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			CategoryMapper mapper = session.getMapper(CategoryMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", category.getId());
			map.put("name", category.getName());
			map.put("description", category.getDescription());
			map.put("imgUrl", category.getImgUrl());
			map.put("parentCategoryId", category.getParentCategoryId());
			mapper.update(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public List<Category> getByParent(String parentId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Category> result = new ArrayList<Category>();
		try {
			CategoryMapper mapper = session.getMapper(CategoryMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("parentCategoryId", parentId);
			result = mapper.getByParent(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public List<Category> getActiveByParent(String parentId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Category> result = new ArrayList<Category>();
		try {
			CategoryMapper mapper = session.getMapper(CategoryMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("parentCategoryId", parentId);
			result = mapper.getActiveByParent(map);
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

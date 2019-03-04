package com.xuwuji.eshop.db.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.mapper.ProductMapper;
import com.xuwuji.eshop.db.util.SessionFactory;
import com.xuwuji.eshop.model.Category;
import com.xuwuji.eshop.model.Product;

@Component
public class ProductDao {

	public void add(Product product) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
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
			ProductMapper mapper = session.getMapper(ProductMapper.class);
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
			ProductMapper mapper = session.getMapper(ProductMapper.class);
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


	public void update(Product product) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", category.getId());
			mapper.update(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public List<Category> getByCategory(String categoryId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Category> result = new ArrayList<Category>();
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("categoryId", categoryId);
			result = mapper.getByCategory(map);
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

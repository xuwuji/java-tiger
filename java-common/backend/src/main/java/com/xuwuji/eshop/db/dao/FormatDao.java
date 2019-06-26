package com.xuwuji.eshop.db.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.mapper.FormatMapper;
import com.xuwuji.eshop.db.util.SessionFactory;
import com.xuwuji.eshop.model.Format;

@Component
public class FormatDao {

	public void add(Format format) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			FormatMapper mapper = session.getMapper(FormatMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("name", format.getName());
			map.put("price", format.getPrice());
			map.put("flashPrice", format.getFlashPrice());
			map.put("productId", format.getProductId());
			mapper.add(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public void update(Format format) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			FormatMapper mapper = session.getMapper(FormatMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", format.getId());
			map.put("name", format.getName());
			map.put("price", format.getPrice());
			map.put("productId", format.getProductId());
			map.put("flashPrice", format.getFlashPrice());
			mapper.update(map);
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
			FormatMapper mapper = session.getMapper(FormatMapper.class);
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
			FormatMapper mapper = session.getMapper(FormatMapper.class);
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

	public List<Format> getAllByProductId(String productId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Format> result = new ArrayList<Format>();
		try {
			FormatMapper mapper = session.getMapper(FormatMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("productId", productId);
			result = mapper.getAllByProductId(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public List<Format> getActiveByProductId(String productId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Format> result = new ArrayList<Format>();
		try {
			FormatMapper mapper = session.getMapper(FormatMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("productId", productId);
			result = mapper.getActiveByProductId(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public Format getById(String formatId) {
		SqlSession session = SessionFactory.openDEVSession();
		Format format = new Format();
		try {
			FormatMapper mapper = session.getMapper(FormatMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", formatId);
			format = mapper.getById(map).get(0);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return format;
	}

}

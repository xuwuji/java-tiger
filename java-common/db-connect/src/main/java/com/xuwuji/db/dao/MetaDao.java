package com.xuwuji.db.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.xuwuji.db.mapper.MetaMapper;
import com.xuwuji.db.model.Category;
import com.xuwuji.db.util.SessionFactory;

public class MetaDao {

	private static MetaDao instance = new MetaDao();

	private MetaDao() {

	}

	public static MetaDao getInstance() {
		return instance;
	}

	public List<Integer> findId(String type, String bigCategory, String subCategory) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			MetaMapper mapper = session.getMapper(MetaMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("type", type);
			map.put("bigCategory", bigCategory);
			map.put("subCategory", subCategory);
			return mapper.findId(map);
		} finally {
			session.close();
		}
	}

	public List<Integer> findId2(String type, String bigCategory, String subCategory) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			MetaMapper mapper = session.getMapper(MetaMapper.class);
			return mapper.findId2(type, bigCategory, subCategory);
		} finally {
			session.close();
		}
	}

	/**
	 * insertion must be committed
	 * 
	 * @param type
	 * @param bigCategory
	 * @param subCategory
	 */
	public void insert(String type, String bigCategory, String subCategory) {
		synchronized (MetaDao.class) {
			SqlSession session = SessionFactory.openDEVSession();
			try {
				MetaMapper mapper = session.getMapper(MetaMapper.class);
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("type", type);
				map.put("bigCategory", bigCategory);
				map.put("subCategory", subCategory);
				mapper.insert(map);
				session.commit();
			} catch (Exception e) {
				session.rollback();
			} finally {
				session.close();
			}
		}
	}

	public List<String> getTypes() {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			MetaMapper mapper = session.getMapper(MetaMapper.class);
			return mapper.getTypes();
		} finally {
			session.close();
		}
	}

	public List<String> getBigCategoryByType(String type) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			MetaMapper mapper = session.getMapper(MetaMapper.class);
			return mapper.getBigCategoryByType(type);
		} finally {
			session.close();
		}
	}

	public List<String> getsubCategoryByBig(String bigCategory) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			MetaMapper mapper = session.getMapper(MetaMapper.class);
			return mapper.getsubCategoryByBig(bigCategory);
		} finally {
			session.close();
		}
	}

	public List<Category> selectAll() {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			MetaMapper mapper = session.getMapper(MetaMapper.class);
			return mapper.selectAll();
		} finally {
			session.close();
		}
	}

	public static void main(String[] args) {
		System.out.println(MetaDao.getInstance().selectAll());
	}

}

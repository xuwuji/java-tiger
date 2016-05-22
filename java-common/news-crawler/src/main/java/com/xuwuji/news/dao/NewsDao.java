package com.xuwuji.news.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.xuwuji.news.mapper.NewsMapper;
import com.xuwuji.news.model.News;
import com.xuwuji.news.util.SessionFactory;

public class NewsDao {

	public void insertNews(News news) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			NewsMapper mapper = session.getMapper(NewsMapper.class);
			mapper.insertNews(news);
			session.commit();
		} catch (Exception e) {
			session.rollback();
		} finally {
			session.close();
		}
	}

	public List<News> findByKeyword(String keyword) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			NewsMapper mapper = session.getMapper(NewsMapper.class);
			return mapper.findByKeyword(keyword);
		} finally {
			session.close();
		}
	}

	public List<String> getTypes() {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			NewsMapper mapper = session.getMapper(NewsMapper.class);
			return mapper.getTypes();
		} finally {
			session.close();
		}
	}

	public List<String> getBigCategoryByType(String type) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			NewsMapper mapper = session.getMapper(NewsMapper.class);
			return mapper.getBigCategoryByType(type);
		} finally {
			session.close();
		}
	}

	public List<String> getsubCategoryByBig(String bigCategory) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			NewsMapper mapper = session.getMapper(NewsMapper.class);
			return mapper.getsubCategoryByBig(bigCategory);
		} finally {
			session.close();
		}
	}

	public List<News> findNewsByCategory(String type, String bigCategory, String subCategory) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			NewsMapper mapper = session.getMapper(NewsMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("type", type);
			map.put("bigCategory", bigCategory);
			map.put("subCategory", subCategory);
			return mapper.findNewsByCategory(map);
		} finally {
			session.close();
		}
	}

}

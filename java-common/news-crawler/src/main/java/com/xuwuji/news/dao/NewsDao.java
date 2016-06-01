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

	public List<News> findNewsByTypeId(String type, String bigCategory, String subCategory) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			NewsMapper mapper = session.getMapper(NewsMapper.class);
			MetaDao metaDao = new MetaDao();
			HashMap<String, Object> map = new HashMap<String, Object>();
			List<Integer> ids = metaDao.findId(type, bigCategory, subCategory);
			System.out.println(ids);
			map.put("typeId", ids);
			return mapper.findNewsByTypeId(map);
		} finally {
			session.close();
		}
	}

	public List<HashMap<String, Object>> findNewsByTypeId2(String type, String bigCategory, String subCategory) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			NewsMapper mapper = session.getMapper(NewsMapper.class);
			MetaDao metaDao = new MetaDao();
			HashMap<String, Object> map = new HashMap<String, Object>();
			List<Integer> ids = metaDao.findId(type, bigCategory, subCategory);
			System.out.println(ids);
			map.put("typeId", ids);
			return mapper.findNewsByTypeId2(map);
		} finally {
			session.close();
		}
	}

	public List<News> findHotNews(String time) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			NewsMapper mapper = session.getMapper(NewsMapper.class);
			return mapper.findHotNews(time);
		} finally {
			session.close();
		}
	}

}

package com.xuwuji.db.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.xuwuji.db.mapper.NewsMapper;
import com.xuwuji.db.model.News;
import com.xuwuji.db.util.SessionFactory;

public class NewsDao {
	MetaDao dao = new MetaDao();

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

	public List<News> findByTitle(String title) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			NewsMapper mapper = session.getMapper(NewsMapper.class);
			return mapper.findByTitle(title);
		} finally {
			session.close();
		}
	}

	public List<News> findNewsByTypeId(String type, String bigCategory, String subCategory) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			NewsMapper mapper = session.getMapper(NewsMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			List<Integer> ids = dao.findId(type, bigCategory, subCategory);
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
			HashMap<String, Object> map = new HashMap<String, Object>();
			List<Integer> ids = dao.findId(type, bigCategory, subCategory);
			System.out.println(ids);
			map.put("typeId", ids);
			return mapper.findNewsByTypeId2(map);
		} finally {
			session.close();
		}
	}

	public List<News> findHotNews(String time, String type) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			NewsMapper mapper = session.getMapper(NewsMapper.class);
			return mapper.findHotNews(time, type);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	public News findById(int id) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			NewsMapper mapper = session.getMapper(NewsMapper.class);
			return mapper.findById(id);
		} finally {
			session.close();
		}
	}

	public static void main(String[] args) {
		NewsDao dao = new NewsDao();
		System.out.println(dao.findHotNews("", ""));
	}

}

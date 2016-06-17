package com.xuwuji.db.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xuwuji.db.mapper.NewsMapper;
import com.xuwuji.db.model.News;
import com.xuwuji.db.util.SessionFactory;

public class NewsDao {
	MetaDao dao = new MetaDao();

	public int insertNews(News news) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			NewsMapper mapper = session.getMapper(NewsMapper.class);
			mapper.insertNews(news);
			int id = news.getId();
			session.commit();
			return id;
		} finally {
			session.close();
		}
	}

	public List<News> findByKeyword(String keyword) {
		PageHelper.startPage(3, 10);
		PageHelper.orderBy("commentNum DESC");
		SqlSession session = SessionFactory.openDEVSession();
		try {
			NewsMapper mapper = session.getMapper(NewsMapper.class);
			List<News> list = mapper.findByKeyword(keyword);
			PageInfo page = new PageInfo(list);
			System.out.println(page.getFirstPage());
			System.out.println(page.getLastPage());
			System.out.println(page.getOrderBy());
			return list;
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

	public News findInfoById(int id) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			NewsMapper mapper = session.getMapper(NewsMapper.class);
			return mapper.findInfoById(id);
		} finally {
			session.close();
		}
	}

	public static void main(String[] args) {
		NewsDao dao = new NewsDao();
		News tnews = new News();
		tnews.setTitle("aaa");
		dao.insertNews(tnews);
		// System.out.println(dao.findHotNews("", ""));
		for (News news : dao.findByKeyword("NBA")) {
			System.out.println(news.getTitle() + news.getCommentNum());
		}
	}

}

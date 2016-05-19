package com.xuwuji.news.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.xuwuji.news.mapper.NewsMapper;
import com.xuwuji.news.model.News;
import com.xuwuji.news.util.SessionFactory;

public class NewsDao implements NewsMapper {

	public void insertNews(News news) {
		SqlSession session = SessionFactory.openSession();
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

	public List<News> findByCategory(String category) {
		SqlSession session = SessionFactory.openSession();
		try {
			NewsMapper mapper = session.getMapper(NewsMapper.class);
			return mapper.findByCategory(category);
		} finally {
			session.close();
		}
	}

	public List<News> findByKeyword(String keyword) {
		SqlSession session = SessionFactory.openSession();
		try {
			NewsMapper mapper = session.getMapper(NewsMapper.class);
			return mapper.findByKeyword(keyword);
		} finally {
			session.close();
		}
	}

}

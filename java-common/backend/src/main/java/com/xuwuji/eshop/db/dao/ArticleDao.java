package com.xuwuji.eshop.db.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.mapper.ArticleMapper;
import com.xuwuji.eshop.db.util.SessionFactory;
import com.xuwuji.eshop.model.Article;

@Component
public class ArticleDao {

	public void add(Article article) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("title", article.getTitle());
			map.put("referProductId", article.getReferProductId());
			map.put("text", article.getText());
			map.put("tags", article.getTags());
			map.put("imgs", article.getImgs());
			map.put("typeId", article.getTypeId());
			map.put("announceStyle", article.getAnnounceStyle());
			map.put("time", new Date());
			map.put("mainImgUrl", article.getMainImgUrl());
			mapper.add(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public List<Article> getById(String id) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Article> result = new ArrayList<Article>();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			result = mapper.getById(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public List<Article> getByRefer(Set<String> productIds, Set<String> categoryIds) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Article> result = new ArrayList<Article>();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("productIds", productIds);
			map.put("categoryIds", categoryIds);
			result = mapper.getByRefer(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public void reActive(String id) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
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
	}

	public void disable(String id) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
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
	}

	public void update(Article article) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("title", article.getTitle());
			map.put("referProductId", article.getReferProductId());
			map.put("text", article.getText());
			map.put("tags", article.getTags());
			map.put("imgs", article.getImgs());
			map.put("time", new Date());
			map.put("id", article.getId());
			map.put("typeId", article.getTypeId());
			map.put("announceStyle", article.getAnnounceStyle());
			map.put("mainImgUrl", article.getMainImgUrl());
			System.out.println(article.getMainImgUrl());
			mapper.update(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public List<Article> getActiveAllByTags(String tag) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Article> result = new ArrayList<Article>();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("tag", tag);
			result = mapper.getActiveAllByTags(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public List<Article> getActiveAllByCondition(String tag, String typeId, String title) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Article> result = new ArrayList<Article>();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			System.out.print("tag:" + tag);
			map.put("tag", tag);
			map.put("typeId", typeId);
			map.put("title", title);
			result = mapper.getActiveAllByCondition(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public List<Article> getActiveAll() {
		SqlSession session = SessionFactory.openDEVSession();
		List<Article> result = new ArrayList<Article>();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
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

	public List<Article> getAll() {
		SqlSession session = SessionFactory.openDEVSession();
		List<Article> result = new ArrayList<Article>();
		try {
			ArticleMapper mapper = session.getMapper(ArticleMapper.class);
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

}

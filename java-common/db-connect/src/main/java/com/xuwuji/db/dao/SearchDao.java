package com.xuwuji.db.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xuwuji.db.mapper.SearchMapper;
import com.xuwuji.db.model.News;
import com.xuwuji.db.util.OrderBy;
import com.xuwuji.db.util.SessionFactory;

public class SearchDao {

	public List<News> findByKeyword(String keyword, int pageNum, OrderBy order) {
		PageHelper.startPage(pageNum, 10);
		PageHelper.orderBy(order.toString() + " DESC");
		SqlSession session = SessionFactory.openDEVSession();
		List<News> list = null;
		try {
			SearchMapper mapper = session.getMapper(SearchMapper.class);
			list = mapper.findByKeyword(keyword);
			return list;
		} finally {
			session.close();
		}
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public PageInfo getPageInfoByKeyword(String keyword) {
		PageHelper.startPage(1, 10);
		SqlSession session = SessionFactory.openDEVSession();
		List<News> list = null;
		try {
			SearchMapper mapper = session.getMapper(SearchMapper.class);
			list = mapper.findByKeyword(keyword);
			PageInfo page = new PageInfo(list);
			return page;
		} finally {
			session.close();
		}
	}

	public static void main(String[] args) {
		SearchDao dao = new SearchDao();
		for (News news : dao.findByKeyword("格林", 1, OrderBy.time)) {
			System.out.println(news.getTitle() + " " + news.getTime());
		}
		PageInfo page = dao.getPageInfoByKeyword("NBA");
		System.out.println(page.getPageNum());
		System.out.println(page.getFirstPage());
		System.out.println(page.getLastPage());
		System.out.println(page.getTotal());
	}

}

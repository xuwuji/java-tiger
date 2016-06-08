package com.xuwuji.news.test.dao;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.joda.time.DateTime;
import org.junit.Test;

import com.xuwuji.db.dao.NewsDao;
import com.xuwuji.db.model.News;
import com.xuwuji.db.util.TimeUtil;

public class NewsDaoTest {

	// @Test
	public void testInsertNews() {
		NewsDao dao = new NewsDao();
		News news = new News();
		news.setTitle("for testing use");
		List<News> list = dao.findByKeyword("for testing use");
		int i = 0;
		for (News n : list) {
			if (n.getTitle().equals("for testing use")) {
				i++;
				break;
			}
		}
		assertEquals(1, i);
	}

	// @Test
	public void findNewsByTypeId() {
		NewsDao dao = new NewsDao();
		ArrayList<News> list = (ArrayList<News>) dao.findNewsByTypeId("教育", "", "");
		for (News news : list) {
			System.out.println(news.getTitle() + "  " + news.getTypeId());
		}
	}

	// @Test
	public void findNewsByTypeId2() {
		NewsDao dao = new NewsDao();
		for (HashMap<String, Object> map : dao.findNewsByTypeId2("教育", "", "")) {
			System.out.println(map.get("title"));
		}
	}

	// @Test
	public void findHotNews() {
		NewsDao dao = new NewsDao();
		String time = TimeUtil.getDateTime(DateTime.now().minusDays(1));
		System.out.println(time);
		for (News news : dao.findHotNews(time, "")) {
			System.out.println(news.getTitle());
		}
	}

	@Test
	public void findByTitle() {
		NewsDao dao = new NewsDao();
		System.out.println(dao.findByTitle("日本黑免税店专坑中国人 曝光后受害者不减反增").size());
	}

}

package com.xuwuji.news.test.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import com.xuwuji.news.dao.NewsDao;
import com.xuwuji.news.model.News;

public class DaoTest {

	@Test
	public void testInsert() {
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

}

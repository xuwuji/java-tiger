package com.xuwuji.db.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.joda.time.DateTime;

import com.xuwuji.db.dao.NewsDao;
import com.xuwuji.db.model.News;
import com.xuwuji.db.util.TimeRange;
import com.xuwuji.db.util.TimeUtil;

public class QueryService {

	private NewsDao dao;

	public QueryService() {
		dao = new NewsDao();
	}

	public List<News> getHotNews(TimeRange range, String type) {
		String time = "";
		switch (range) {
		case Day:
			time = TimeUtil.getDateTime(DateTime.now().minusDays(1));
			break;
		case Week:
			time = TimeUtil.getDateTime(DateTime.now().minusDays(7));
			break;
		case Month:
			time = TimeUtil.getDateTime(DateTime.now().minusDays(30));
			break;
		case All:
			time = "";
			break;
		}
		System.out.println(time);
		ArrayList<News> list = (ArrayList<News>) dao.findHotNews(time, type);
		return list;
	}

	public static void main(String[] args) throws IOException {
		QueryService client = new QueryService();
		ArrayList<News> list = (ArrayList<News>) client.getHotNews(TimeRange.Day, "");
		for (News news : list) {
			System.out.println(news.getTitle() + "----" + news.getLink());
		}
	}

}

package com.xuwuji.news.client;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.joda.time.DateTime;

import com.xuwuji.common.java.util.TimeUtil;
import com.xuwuji.news.dao.NewsDao;
import com.xuwuji.news.enumType.TimeRange;
import com.xuwuji.news.model.News;

public class QueryClient {

	private NewsDao dao;

	public QueryClient() {
		dao = new NewsDao();
	}

	public List<News> getHotNews(TimeRange range) {
		String time = "";
		switch (range) {
		case Day:
			time = TimeUtil.getDateTime(DateTime.now().minusDays(1));
		case Week:
			time = TimeUtil.getDateTime(DateTime.now().minusDays(7));
		case Month:
			time = TimeUtil.getDateTime(DateTime.now().minusDays(30));
		case All:
			time = "";
		}
		ArrayList<News> list = (ArrayList<News>) dao.findHotNews(time);
		return list;
	}

	private void writeHtml(News news) throws IOException {
		File dir = new File(TimeUtil.getSimpleDateTime(DateTime.now()));
		if (!dir.exists()) {
			dir.mkdir();
		}

		File file = new File(TimeUtil.getSimpleDateTime(DateTime.now()) + "/" + news.getTitle() + ".html");

		if (!file.exists()) {
			file.createNewFile();
			try {
				FileWriter fw = new FileWriter(file.getAbsoluteFile());
				BufferedWriter bw = new BufferedWriter(fw);
				String html = "<!DOCTYPE html><html><head><meta charset=\"UTF-8\"><title>{title}</title></head><body>{body}</body></html>";
				html = html.replace("{title}", news.getTitle()).replace("{body}", news.getContent());
				bw.write(html);
				bw.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) throws IOException {
		QueryClient client = new QueryClient();
		ArrayList<News> list = (ArrayList<News>) client.getHotNews(TimeRange.Day);
		for (News news : list) {
			System.out.println(news.getTitle());
			client.writeHtml(news);
		}
	}

}

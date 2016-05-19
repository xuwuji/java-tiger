package com.xuwuji.news.task;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map.Entry;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.xuwuji.news.dao.NewsDao;
import com.xuwuji.news.model.News;

public class Task implements Runnable {

	private Storage storage;
	private NewsDao dao;

	public Task(Storage storage) {
		this.storage = storage;
		dao = new NewsDao();
	}

	public void run() {
		String link = storage.getLink();
		try {
			processOriginLink(link);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void processOriginLink(String origin) throws IOException {
		long start = System.currentTimeMillis();
		Document doc;
		Elements hrefs = null;
		doc = Jsoup.connect(origin).get();
		hrefs = doc.select("a[href]");
		for (Element e : hrefs) {
			try {
				processSubLink(e);
			} catch (java.net.SocketTimeoutException e1) {
				System.out.println(e.attr("href").trim() + " time out!!!!!!!!");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		long end = System.currentTimeMillis();
		System.out.println(origin + " has finished, it costs " + (end - start) / 1000);
	}

	public void processSubLink(Element href) throws IOException {
		String title = href.text();
		String link = href.attr("href").trim();
		if (title.length() >= 8 && link.indexOf("http") != -1) {
			HashMap<String, String> map = getInfo(link);
			String content = getContent(link);
			String time = map.get("pubtime");
			String category = map.get("sub_nav");
			if (category != null) {
				storage.put(title, link);
				System.out.println(title);
				System.out.println(link);
				System.out.println(category);
				System.out.println("-------\n");
				News news = new News();
				news.setTitle(title);
				news.setLink(link);
				news.setCategory(category);
				news.setTime(time);
				news.setContent(content);
				dao.insertNews(news);
			}
		}
	}

	public HashMap<String, String> getInfo(String link) throws IOException {
		Document doc = Jsoup.connect(link).get();
		HashMap<String, String> map = new HashMap<String, String>();
		String s = doc.toString();
		// System.out.println(link);
		for (int i = 0; i < 2; i++) {
			try {
				s = s.substring(s.indexOf("ARTICLE_INFO = window.ARTICLE_INFO"), s.indexOf("</head>"));
				s = s.substring(s.indexOf("{"), s.indexOf("	</script> ") + 1);
				s = s.replace("	", "");
				String[] infos = s.split(",\n");
				for (String info : infos) {
					String key = info.substring(0, info.indexOf(":"));
					String value = info.substring(info.indexOf(":") + 2, info.length() - 1);
					map.put(key, value);
				}
				break;
			} catch (Exception e) {
				System.out.println(link + " can not get info");
			}
			try {
				Thread.sleep(50);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		return map;
	}

	private String getContent(String link) throws IOException {
		Document doc = Jsoup.connect(link).get();
		Elements attrs = doc.select("[bosszone=\"content\"]");
		String s = "";
		for (Element e : attrs) {
			// System.out.println(e);
			s = e.toString();
			break;
		}
		return s;

	}

	@Deprecated
	private String getCategory(String link) throws IOException {
		// System.out.println(link);
		Document doc = Jsoup.connect(link).get();
		Elements attrs = doc.select("[bosszone=\"ztTopic\"]");
		String category = null;
		for (Element e : attrs) {
			category = e.text();
			if (category != null || !category.equals("")) {
				break;
			}
		}
		return category;
	}

	@Deprecated
	private String replace(String s) {
		s = s.substring(s.indexOf("ARTICLE_INFO = window.ARTICLE_INFO"), s.indexOf("</head>"));
		return s;
	}
}

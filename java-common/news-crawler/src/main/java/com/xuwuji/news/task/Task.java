package com.xuwuji.news.task;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.xuwuji.news.dao.MetaDao;
import com.xuwuji.news.dao.NewsDao;
import com.xuwuji.news.model.News;

public class Task implements Runnable {

	private Storage storage;
	private NewsDao newsDao;
	private MetaDao metaDao;

	public Task(Storage storage) {
		this.storage = storage;
		newsDao = new NewsDao();
		metaDao = new MetaDao();
	}

	public void run() {
		for (int i = 0; i < 100; i++) {
			System.out.println("[" + Thread.currentThread().getName() + "] - is running");
			String link = storage.getLink();
			processOriginLink(link);
		}
	}

	/**
	 * get all valid hrefs from the original page
	 * 
	 * @param origin
	 * @throws IOException
	 */
	public void processOriginLink(String origin) {
		System.out.println("[" + Thread.currentThread().getName() + "] -" + origin + " is processing");
		long start = System.currentTimeMillis();
		Document doc = null;
		// 1. get the doc from this original page
		/**
		 * prevent from timing out at the first time
		 */
		for (int i = 0; i < 2; i++) {
			try {
				doc = Jsoup.connect(origin).get();
				break;
			} catch (java.net.SocketTimeoutException e) {
				System.out.println(origin + " times out, trying one more time");
			} catch (org.jsoup.HttpStatusException e1) {
				System.out.println(origin + " http status error, trying one more time");
			} catch (org.jsoup.UnsupportedMimeTypeException e2) {
				System.out.println(origin + " is not a valid url");
			} catch (java.net.UnknownHostException e3) {
				System.out.println(origin + " host unknown");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		if (doc == null) {
			return;
		}

		// 2. get all valid hrefs from the page
		Elements hrefs = doc.select("a[href]");

		// 3. process each href
		for (Element e : hrefs) {
			// try to process the sub link for the second time if the connection
			// times out at the first time
			if (e == null) {
				continue;
			}
			for (int i = 0; i < 2; i++) {
				try {
					processSubLink(e);
					break;
				} catch (java.net.SocketTimeoutException e1) {
					System.out.println(e.attr("href").trim() + " time out, trying one more time");
				} catch (java.net.SocketException e5) {
					System.out.println(e.attr("href").trim() + " connection rest");
				} catch (java.net.MalformedURLException e6) {
					System.out.println(e.attr("href").trim() + " Illegal character in URL");
				} catch (org.jsoup.UnsupportedMimeTypeException e2) {
					System.out.println(e.attr("href").trim() + " is not a valid url");
				} catch (org.jsoup.HttpStatusException e3) {
					System.out.println(e.attr("href").trim() + " is not a valid url");
				} catch (IOException e4) {
					e4.printStackTrace();
				}
			}
		}
		long end = System.currentTimeMillis();
		System.out.println("[" + Thread.currentThread().getName() + "] -" + origin + " has finished, it costs "
				+ (end - start) / 1000);
	}

	public void processSubLink(Element href) throws IOException {
		String title = href.text();
		String link = href.attr("href").trim();
		// 1.1 check whether it is an article based on its title and link
		// address
		if (title.length() >= 8 && link.indexOf("http") != -1) {
			// 1.2 get info of this article from a particular part of js in the
			// page, if no info found, then it is not an article
			Document doc = Jsoup.connect(link).get();
			HashMap<String, String> map = getInfo(link, doc);
			if (map.size() == 0) {
				return;
			}
			// 2. get info
			String content = getContent(doc);
			String time = map.get("pubtime");
			String type = map.get("site_cname");
			String subCategory = map.get("subCategory");
			// 3. get its big category, if it is empty, set it to sub_nav
			String bigCategory = map.get("subName");
			try {
				bigCategory = bigCategory.substring(bigCategory.indexOf("cname:'") + 7, bigCategory.length() - 1);
			} catch (java.lang.NullPointerException e) {
				bigCategory = map.get("sub_nav");
			}
			if (bigCategory == null || bigCategory.equals("")) {
				bigCategory = map.get("sub_nav");
			}

			// 4. set info into a news object and persist it
			if (bigCategory != null) {
				System.out.println("title: " + title);
				System.out.println("link: " + link);
				System.out.println("type: " + type);
				System.out.println("bigCategory: " + bigCategory);
				System.out.println("subCategory: " + subCategory);
				System.out.println("-------\n");
				News news = new News();
				news.setTitle(title);
				news.setLink(link);
				// news.setType(type);
				// news.setBigCategory(bigCategory);
				// news.setSubCategory(subCategory);
				news.setTime(time);
				news.setContent(content);
				ArrayList<Integer> id = (ArrayList<Integer>) metaDao.findId(type, bigCategory, subCategory);
				if (id.size() == 0) {
					metaDao.insert(type, bigCategory, subCategory);
					news.setTypeId(metaDao.findId(type, bigCategory, subCategory).get(0));
				} else {
					news.setTypeId(id.get(0));
				}
				newsDao.insertNews(news);
			}
		}
	}

	/**
	 * get the info of the article if it has the particular js part
	 * 
	 * @param link
	 * @return
	 * @throws IOException
	 */
	private HashMap<String, String> getInfo(String link, Document doc) throws IOException {
		HashMap<String, String> map = new HashMap<String, String>();
		for (int i = 0; i < 1; i++) {
			try {
				String s = doc.toString();
				s = s.substring(s.indexOf("ARTICLE_INFO = window.ARTICLE_INFO"), s.indexOf("</head>"));
				s = s.substring(s.indexOf("{"), s.indexOf("	</script> ") + 1);
				s = s.replace("	", "");
				String[] infos = s.split(",\n");
				for (String info : infos) {
					String key = info.substring(0, info.indexOf(":"));
					String value = info.substring(info.indexOf(":") + 2, info.length() - 1);
					if (key.equals("pubtime")) {
						value = value.replace("年", "-").replace("月", "-").replace("日", "-");
					}
					map.put(key, value);
				}
				map.put("subCategory", getChineseSubCategory(doc));
				break;
			} catch (Exception e) {
				// System.out.println(link + " can not get info");
			}
		}
		// if this is not an article, then add this link to the storage as an
		// original link to be processed
		if (map.size() == 0) {
			storage.addLink(link);
		}
		return map;
	}

	@SuppressWarnings("null")
	private String getChineseSubCategory(Document doc) {
		Elements attrs = doc.select("[bosszone=\"ztTopic\"]");
		String category = "";
		for (Element e : attrs) {
			category = e.text();
			if (category != null || !category.equals("")) {
				break;
			}
		}
		return category;
	}

	/**
	 * get the content of the article
	 * 
	 * @param link
	 * @return
	 * @throws IOException
	 */
	private String getContent(Document doc) throws IOException {
		Elements attrs = doc.select("[bosszone=\"content\"]");
		String s = "";
		for (Element e : attrs) {
			s = e.toString();
			break;
		}
		return s;
	}

	@SuppressWarnings({ "unused", "null" })
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

	@SuppressWarnings("unused")
	@Deprecated
	private String replace(String s) {
		s = s.substring(s.indexOf("ARTICLE_INFO = window.ARTICLE_INFO"), s.indexOf("</head>"));
		return s;
	}
}

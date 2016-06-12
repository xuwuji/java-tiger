package com.xuwuji.news.task;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.xuwuji.db.dao.MetaDao;
import com.xuwuji.db.dao.NewsDao;
import com.xuwuji.db.model.News;
import com.xuwuji.news.cache.CategoryCache;
import com.xuwuji.news.util.HttpUtil;

public class Task implements Runnable {

	private Storage storage;
	private NewsDao newsDao;
	private MetaDao metaDao;

	public Task(Storage storage) {
		this.storage = storage;
		newsDao = new NewsDao();
		metaDao = MetaDao.getInstance();
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
		for (int i = 0; i < 5; i++) {
			try {
				doc = Jsoup.connect(origin).get();
				break;
			} catch (java.net.SocketTimeoutException e) {
				System.out.println(
						"[" + Thread.currentThread().getName() + "] -" + origin + " times out, trying one more time");
			} catch (org.jsoup.HttpStatusException e1) {
				System.out.println("[" + Thread.currentThread().getName() + "] -" + origin
						+ " http status error, trying one more time");
			} catch (org.jsoup.UnsupportedMimeTypeException e2) {
				System.out.println("[" + Thread.currentThread().getName() + "] -" + origin + " is not a valid url");
			} catch (java.net.UnknownHostException e3) {
				System.out.println("[" + Thread.currentThread().getName() + "] -" + origin + " host unknown");
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

			if (e == null) {
				continue;
			}

			// try to process the sub link for the second time if the connection
			// times out at the first time
			for (int i = 0; i < 2; i++) {
				try {
					processSubLink(e);
					break;
				} catch (java.net.SocketTimeoutException e1) {
					System.out.println("[" + Thread.currentThread().getName() + "] -" + e.attr("href").trim()
							+ " time out, trying one more time");
				} catch (java.net.SocketException e5) {
					System.out.println("[" + Thread.currentThread().getName() + "] -" + e.attr("href").trim()
							+ " connection rest");
				} catch (java.net.MalformedURLException e6) {
					System.out.println("[" + Thread.currentThread().getName() + "] -" + e.attr("href").trim()
							+ " Illegal character in URL");
				} catch (org.jsoup.UnsupportedMimeTypeException e2) {
					System.out.println("[" + Thread.currentThread().getName() + "] -" + e.attr("href").trim()
							+ " is not a valid url");
				} catch (org.jsoup.HttpStatusException e3) {
					System.out.println("[" + Thread.currentThread().getName() + "] -" + e.attr("href").trim()
							+ " is not a valid url");
				} catch (java.io.EOFException e5) {
					System.out.println("[" + Thread.currentThread().getName() + "] -" + e.attr("href").trim()
							+ " is eof exception");
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

			// check if this article is already in the db
			if (newsDao.findByTitle(title).size() != 0) {
				return;
			}

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
			String comment_num = map.get("comment_num");
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
				System.out.println("comment_num: " + comment_num);
				System.out.println("-------\n");
				News news = new News();
				news.setTitle(title);
				news.setLink(link);
				news.setTime(time);
				news.setContent(content);
				news.setCommentNum(Integer.valueOf(comment_num));

				// 1.search in cache
				Integer typeId = CategoryCache.getInstance().get(type + bigCategory + subCategory);
				if (typeId != null) {
					news.setTypeId(typeId);
				} else {
					// 2.search in db
					ArrayList<Integer> list = (ArrayList<Integer>) metaDao.findId(type, bigCategory, subCategory);
					// 2.1 if it is not in db, insert the meta record
					if (list.size() == 0) {
						MetaDao.getInstance().insert(type, bigCategory, subCategory);
						news.setTypeId(metaDao.findId(type, bigCategory, subCategory).get(0));
					}
					// 2.2 if it is in db, got the id
					else {
						news.setTypeId(list.get(0));
					}
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
		String cmt_id = "";
		for (int i = 0; i < 1; i++) {
			try {
				String s = doc.toString();
				if (s.indexOf("var cmt_id='") != -1) {
					cmt_id = s.substring(s.indexOf("var cmt_id='") + 12, s.indexOf("var cmt_id='") + 20);
					cmt_id = cmt_id.replace("\"", "").replace(" ", "").replace(";", "").replace("\n", "")
							.replace("'", "").replace("\t", "");
				} else {
					if (s.indexOf("cmt_id = ") != -1) {
						cmt_id = s.substring(s.indexOf("cmt_id = ") + 9, s.indexOf("cmt_id = ") + 20);
						cmt_id = cmt_id.replace("\"", "").replace(" ", "").replace(";", "").replace("\n", "")
								.replace("'", "").replace("\t", "");
					}
				}
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
				map.put("comment_num", this.getCommentNum(cmt_id));
				break;
			} catch (Exception e) {
			}
		}
		// if this is not an article, then add this link to the storage as an
		// original link to be processed
		if (map.size() == 0 && link.indexOf("v.qq.com") == -1 && link.indexOf("class.qq.com") == -1
				&& link.indexOf("qq") != -1) {
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

	private String getCommentNum(String cmt_id) {
		if (cmt_id.equals("")) {
			return "0";
		}
		String url = "http://coral.qq.com/article/{id}/commentnum?callback=_cbSum";
		url = url.replace("{id}", cmt_id);
		System.out.println(url);
		JSONParser parser = new JSONParser();
		String number = "";
		try {
			String response = HttpUtil.getHttpResponse(url);
			response = response.substring(response.indexOf("({") + 1, response.length() - 1);
			JSONObject o = (JSONObject) parser.parse(response);
			JSONObject data = (JSONObject) o.get("data");
			if (data.get("commentnum") != null) {
				number = (String) data.get("commentnum");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (number.equals("")) {
			return "0";
		}
		return number;
	}
}

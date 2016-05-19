package com.xuwuji.news.client;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import com.xuwuji.news.dao.NewsDao;
import com.xuwuji.news.model.News;

public class QueryClient {

	public static void main(String[] args) throws ParseException {
		NewsDao dao = new NewsDao();
		System.out.println(dao.findByCategory("NBA"));

		// System.out.println(dao.findByKeyword("27"));
		Document doc;
		HashMap<String, String> map = new HashMap<String, String>();
		try {
			doc = Jsoup.connect("http://news.qq.com/a/20160519/007513.htm").get();
			String s = doc.toString();
			System.out.println(s.indexOf("ARTICLE_INFO = window.ARTICLE_INFO"));
			s = s.substring(s.indexOf("ARTICLE_INFO = window.ARTICLE_INFO"), s.indexOf("</head>"));
			s = s.substring(s.indexOf("{"), s.indexOf("	</script> ") + 1);
			s = s.replace("	", "");
			String[] infos = s.split(",\n");
			for (String info : infos) {
				// System.out.println(info + "------");
				String key = info.substring(0, info.indexOf(":"));
				String value = info.substring(info.indexOf(":") + 2, info.length() - 1);
				System.out.println(key);
				System.out.println(value);
				map.put(key, value);
				System.out.println("------");

			}
			// System.out.println(s);
			PrintWriter out = new PrintWriter("filename.txt");
			out.print(s);
			out.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

package com.xuwuji.backend.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xuwuji.backend.cache.NewsCacheUtil;
import com.xuwuji.common.java.util.TimeUtil;
import com.xuwuji.db.dao.MetaDao;
import com.xuwuji.db.dao.NewsDao;
import com.xuwuji.db.model.News;
import com.xuwuji.db.service.QueryService;
import com.xuwuji.db.util.TimeRange;

@Controller
@RequestMapping(value = "/news")
public class NewsController {

	@Autowired
	NewsDao newsDao;
	@Autowired
	MetaDao metaDao;
	@Autowired
	QueryService client;
	@Autowired
	NewsCacheUtil newsCacheUtil;

	@RequestMapping(value = "/hotnews", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<News> getHotNews(@RequestParam("time") String time, @RequestParam("type") String type)
			throws UnsupportedEncodingException {
		type = URLDecoder.decode(type, "UTF-8");
		ArrayList<News> list = (ArrayList<News>) client.getHotNews(TimeRange.Day, type);
		System.out.println(list.size());
		ArrayList<News> result = new ArrayList<News>();
		HashSet<String> set = new HashSet<String>();
		for (int i = 0; i < list.size(); i++) {
			if (!set.contains(list.get(i).getLink())) {
				set.add(list.get(i).getLink());
				News news = list.get(i);
				Document doc = Jsoup.parse(news.getContent());
				Elements elements = doc.getElementsByTag("img");
				String imgLink = "";
				for (Element e : elements) {
					imgLink = e.attr("src");
					if (imgLink.indexOf("http") != -1) {
						break;
					}
				}
				news.setImgLink(imgLink);
				news.setContent("");
				result.add(news);
			}
		}
		Collections.reverse(result);
		return result;
	}

	@RequestMapping(value = "/dailyHotnews", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<News> getDailyHotNews(@RequestParam("type") String type) throws UnsupportedEncodingException {
		type = URLDecoder.decode(type, "UTF-8");
		ArrayList<News> list = (ArrayList<News>) newsCacheUtil.getDailyCacheHotNews(type);
		if (list.size() == 0) {
			list = (ArrayList<News>) newsCacheUtil.getAllCacheHotNews(type);
		}
		System.out.println(list.size());
		return list;
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ModelAndView findNewsById(@PathVariable("id") String id) {
		ModelAndView model = new ModelAndView("page/detail");
		News news = newsDao.findById(Integer.valueOf(id));
		model.addObject("news", news);
		return model;
	}

	@ResponseBody
	@RequestMapping(value = "/type", method = RequestMethod.GET)
	public ArrayList<String> getCategory() {
		return (ArrayList<String>) metaDao.getTypes();
	}
}

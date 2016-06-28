package com.xuwuji.backend.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.xuwuji.db.dao.NewsDao;
import com.xuwuji.db.dao.SearchDao;
import com.xuwuji.db.model.News;
import com.xuwuji.db.util.OrderBy;
import com.xuwuji.db.util.TimeUtil;

@Controller
@RequestMapping(value = "/search")
public class SearchController {

	@Autowired
	private SearchDao searchDao;
	@Autowired
	private NewsDao newsDao;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView model = new ModelAndView("/home");
		model.addObject("hotKW", searchDao.findHotKW());
		return model;
	}

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView searchPage(@RequestParam("keyword") String keyword, @RequestParam("pageNum") String pageNum,
			@RequestParam("orderBy") String orderBy) {
		int page = 1;
		if (!pageNum.equals("")) {
			page = Integer.valueOf(pageNum);
		}
		List<News> list = this.getSearchResult(keyword, pageNum, orderBy);
		System.out.println("order by: " + orderBy);
		System.out.println(list.size());
		ArrayList<News> result = new ArrayList<News>();
		HashSet<String> categories = new HashSet<String>();
		HashSet<String> times = new HashSet<String>();
		for (News n : list) {
			System.out.println(n.getTitle());
			categories.add(n.getType());
			times.add(n.getTime().substring(0, 4));
			result.add(n);
		}
		PageInfo info = searchDao.getPageInfoByKeyword(keyword);
		ModelAndView model = new ModelAndView("search/index");
		model.addObject("searchResult", result);
		model.addObject("totalNum", info.getLastPage());
		model.addObject("pageNum", page);
		model.addObject("keyword", keyword);
		model.addObject("orderBy", orderBy);
		model.addObject("categories", categories);
		model.addObject("times", times);
		// save this search behavior to db
		searchDao.insertRecord(keyword, TimeUtil.currentTimewithMinutes());
		return model;
	}

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public ModelAndView searchPageByCategory(@RequestParam("keyword") String keyword,
			@RequestParam("pageNum") String pageNum, @RequestParam("orderBy") String orderBy,
			@RequestParam("category") String category) {
		int page = 1;
		if (!pageNum.equals("")) {
			page = Integer.valueOf(pageNum);
		}
		List<News> list = this.getSearchResult(keyword, pageNum, orderBy);
		ArrayList<News> result = new ArrayList<News>();
		HashSet<String> categories = new HashSet<String>();
		HashSet<String> times = new HashSet<String>();
		for (News n : list) {
			categories.add(n.getType());
			times.add(n.getTime().substring(0, 4));
			if (n.getType().equals(category)) {
				result.add(n);
			}
		}
		PageInfo info = searchDao.getPageInfoByKeyword(keyword);
		ModelAndView model = new ModelAndView("search/index");
		model.addObject("searchResult", result);
		model.addObject("totalNum", info.getLastPage());
		model.addObject("pageNum", page);
		model.addObject("keyword", keyword);
		model.addObject("orderBy", orderBy);
		model.addObject("categories", categories);
		model.addObject("times", times);
		// save this search behavior to db
		searchDao.insertRecord(keyword, TimeUtil.currentTimewithMinutes());
		return model;
	}

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/time", method = RequestMethod.GET)
	public ModelAndView searchPageByTime(@RequestParam("keyword") String keyword,
			@RequestParam("pageNum") String pageNum, @RequestParam("orderBy") String orderBy,
			@RequestParam("time") String time) {
		int page = 1;
		if (!pageNum.equals("")) {
			page = Integer.valueOf(pageNum);
		}
		List<News> list = this.getSearchResult(keyword, pageNum, orderBy);
		HashSet<String> categories = new HashSet<String>();
		HashSet<String> times = new HashSet<String>();
		ArrayList<News> result = new ArrayList<News>();
		for (News n : list) {
			categories.add(n.getType());
			times.add(n.getTime().substring(0, 4));
			if (n.getTime().indexOf(time) != -1) {
				result.add(n);
			}
		}
		PageInfo info = searchDao.getPageInfoByKeyword(keyword);
		ModelAndView model = new ModelAndView("search/index");
		model.addObject("searchResult", result);
		model.addObject("totalNum", info.getLastPage());
		model.addObject("pageNum", page);
		model.addObject("keyword", keyword);
		model.addObject("orderBy", orderBy);
		model.addObject("categories", categories);
		model.addObject("times", times);
		// save this search behavior to db
		searchDao.insertRecord(keyword, TimeUtil.currentTimewithMinutes());
		return model;
	}

	private List<News> getSearchResult(String keyword, String pageNum, String orderBy) {
		int page = 1;
		if (!pageNum.equals("")) {
			page = Integer.valueOf(pageNum);
		}
		OrderBy order = null;
		if (orderBy.equals("commentNum")) {
			order = OrderBy.commentNum;
		} else {
			order = OrderBy.time;
		}
		List<News> list = searchDao.findByKeyword(keyword, page, order);
		return list;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@ResponseBody
	@RequestMapping(value = "/pageInfo", method = RequestMethod.GET)
	public PageInfo getPageInfo(@RequestParam("keyword") String keyword) {
		PageInfo info = searchDao.getPageInfoByKeyword(keyword);
		info.setList(null);
		return info;
	}

}

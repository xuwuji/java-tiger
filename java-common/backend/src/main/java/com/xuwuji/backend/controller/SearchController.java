package com.xuwuji.backend.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.xuwuji.db.dao.SearchDao;
import com.xuwuji.db.model.News;
import com.xuwuji.db.util.OrderBy;
import com.xuwuji.db.util.TimeUtil;

@Controller
@RequestMapping(value = "/search")
public class SearchController {

	@Autowired
	private SearchDao searchDao;

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
		OrderBy order = null;
		if (orderBy.equals("time")) {
			order = OrderBy.time;
		} else {
			order = OrderBy.commentNum;
		}
		List<News> list = searchDao.findByKeyword(keyword, page, order);
		System.out.println(list.size());
		ArrayList<News> result = new ArrayList<News>();
		for (News n : list) {
			System.out.println(n.getTitle());
			// n.setContent("");
			result.add(n);
		}
		PageInfo info = searchDao.getPageInfoByKeyword(keyword);
		ModelAndView model = new ModelAndView("search/index");
		model.addObject("searchResult", result);
		model.addObject("totalNum", info.getLastPage());
		model.addObject("pageNum", page);
		model.addObject("keyword", keyword);
		model.addObject("orderBy", orderBy);
		// save this search behavior to db
		searchDao.insertRecord(keyword, TimeUtil.currentTimewithMinutes());
		return model;
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

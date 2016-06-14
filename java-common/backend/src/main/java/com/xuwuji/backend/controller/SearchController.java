package com.xuwuji.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.xuwuji.db.dao.SearchDao;

@Controller
@RequestMapping(value = "/search")
public class SearchController {

	@Autowired
	private SearchDao searchDao;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index() {
		return new ModelAndView("search/index");
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

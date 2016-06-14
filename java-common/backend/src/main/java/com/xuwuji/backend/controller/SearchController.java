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

@Controller
@RequestMapping(value = "/search")
public class SearchController {

	@Autowired
	private SearchDao searchDao;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView searchPage(@RequestParam("keyword") String keyword, @RequestParam("pageNum") String pageNum) {
		List<News> list = searchDao.findByKeyword(keyword, Integer.valueOf(pageNum), OrderBy.commentNum);
		System.out.println(list.size());
		ArrayList<News> result = new ArrayList<News>();
		for (News n : list) {
			System.out.println(n.getTitle());
			n.setContent("");
			result.add(n);
		}
		return new ModelAndView("search/index").addObject("searchResult", result);
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

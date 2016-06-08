package com.xuwuji.backend.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xuwuji.db.dao.NewsDao;
import com.xuwuji.db.model.News;
import com.xuwuji.db.service.QueryService;
import com.xuwuji.db.util.TimeRange;

@Controller
public class IndexController {

	NewsDao dao = new NewsDao();
	QueryService client = new QueryService();

	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("index");
	}

	@RequestMapping(value = "/hotnews", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<News> getHotNews() {
		ArrayList<News> list = (ArrayList<News>) client.getHotNews(TimeRange.Day);
		for (News news : list) {
			news.setContent("");
		}
		System.out.println(client.getHotNews(TimeRange.Day).size());
		return list;
	}

	@RequestMapping(value = "/page", method = RequestMethod.GET)
	public ModelAndView getPage() {
		return new ModelAndView("page");
	}

	@RequestMapping(value = "/news/{id}", method = RequestMethod.GET)
	@ResponseBody
	public News findNewsById(@PathVariable("id") String id) {
		News news = dao.findById(Integer.valueOf(id));
		return news;
	}

}

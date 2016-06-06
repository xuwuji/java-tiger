package com.xuwuji.backend.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xuwuji.news.dao.NewsDao;
import com.xuwuji.news.enumType.TimeRange;
import com.xuwuji.news.model.News;
import com.xuwuji.news.client.QueryClient;

@Controller
public class IndexController {

	NewsDao dao = new NewsDao();
	QueryClient client = new QueryClient();

	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("index");
	}

	@RequestMapping(value = "/hotnews", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<News> getHotNews() {
		ArrayList<News> list = (ArrayList<News>) client.getHotNews(TimeRange.All);
		for (News news : list) {
			news.setContent("");
		}
		System.out.println(client.getHotNews(TimeRange.All).size());
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

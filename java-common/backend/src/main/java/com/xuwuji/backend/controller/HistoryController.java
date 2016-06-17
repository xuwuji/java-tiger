package com.xuwuji.backend.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuwuji.backend.cache.HistoryCacheUtil;
import com.xuwuji.db.dao.NewsDao;
import com.xuwuji.db.model.News;

@Controller
@RequestMapping(value = "/history")
public class HistoryController {
	@Autowired
	private HistoryCacheUtil historyCacheUtil;
	@Autowired
	private NewsDao newsDao;

	@ResponseBody
	@RequestMapping(value = "/{username}", method = RequestMethod.GET)
	public List<News> getHistory(@PathVariable("username") String username) {
		List<String> ids = historyCacheUtil.getLatestWatchedHistory(username);
		List<News> result = new ArrayList<News>();
		for (String id : ids) {
			result.add(newsDao.findInfoById(Integer.valueOf(id)));
		}
		return result;
	}

}

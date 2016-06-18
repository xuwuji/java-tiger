package com.xuwuji.backend.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuwuji.backend.cache.HistoryCacheUtil;
import com.xuwuji.db.dao.NewsDao;
import com.xuwuji.db.model.News;
import com.xuwuji.db.model.User;

@Controller
@RequestMapping(value = "/history")
public class HistoryController {
	@Autowired
	private HistoryCacheUtil historyCacheUtil;
	@Autowired
	private NewsDao newsDao;

	@ResponseBody
	@RequestMapping(value = "", method = RequestMethod.GET)
	public List<String[]> getHistory(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getAttribute("user");
		System.out.println(user);
		// List<News> result = new ArrayList<News>();
		List<String[]> result = new ArrayList<String[]>();
		if (user != null) {
			List<String> ids = historyCacheUtil.getLatestWatchedHistory(user.getUsername());
			System.out.println(ids);
			for (String id : ids) {
				News news = new News();
				System.out.println(id);
				News n = newsDao.findInfoById(Integer.valueOf(id));
				System.out.println(n);
				String[] strs = new String[2];
				strs[0] = n.getTitle();
				strs[1] = n.getType();
				// news.setTitle(n.getTitle());
				// news.setType(n.getType());
				result.add(strs);
			}
		}
		System.out.println(result);
		return result;
	}

}

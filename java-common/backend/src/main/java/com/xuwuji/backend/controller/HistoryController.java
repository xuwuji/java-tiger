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
		String username = (String) request.getAttribute("username");
		List<String[]> result = null;
		result = new ArrayList<String[]>();
		List<String> records = historyCacheUtil.getAllWatchedHistory(username);
		for (String record : records) {
			String[] strs = record.split("@");
			int id = 0;
			try {
				id = Integer.valueOf(strs[0]);
				String time = strs[1];
				News n = newsDao.findInfoById(id);
				String[] info = new String[3];
				info[0] = n.getTitle();
				info[1] = n.getType();
				info[2] = time;
				result.add(info);
			} catch (NumberFormatException e) {
				System.out.println(strs[0] + "is not valid");
			} catch (NullPointerException e) {
				System.out.println(id + " is not a valid news id");
			}
		}
		return result;
	}

}

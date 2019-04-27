package com.xuwuji.eshop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuwuji.eshop.db.dao.LotteryHistoryDao;
import com.xuwuji.eshop.db.dao.UserDao;
import com.xuwuji.eshop.model.LotteryHistory;

/**
 * 
 * 中奖历史纪录Controller
 * 
 * @author xuwuji
 *
 */
@Controller
@RequestMapping(value = "/lotteryHistory")
public class LotteryHistoryController {
	@Autowired
	private UserDao userDao;
	@Autowired
	private LotteryHistoryDao lotteryHistoryDao;

	/**
	 * 获取此用户的中奖纪录
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/getLotteryHistoryByOpenId", method = RequestMethod.GET)
	@ResponseBody
	public List<LotteryHistory> getLotteryHistoryByOpenId(HttpServletRequest request, HttpServletResponse response) {
		String openId = request.getParameter("openId");
		List<LotteryHistory> result = new ArrayList<LotteryHistory>();
		result = lotteryHistoryDao.getByOpenId(openId);
		return result;
	}

}

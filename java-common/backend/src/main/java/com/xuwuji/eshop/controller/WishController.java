package com.xuwuji.eshop.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuwuji.eshop.db.dao.WishDao;
import com.xuwuji.eshop.model.Wish;

/**
 * 心愿
 * 
 * @author xuwuji
 *
 */
@Controller
@RequestMapping(value = "/wish")
public class WishController {
	@Autowired
	private WishDao wishDao;

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	@ResponseBody
	public void add(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String openId = request.getParameter("openId");
		String memo = request.getParameter("memo");
		String wechatId = request.getParameter("wechatId");
		Wish wish = new Wish();
		wish.setWechatId(wechatId);
		wish.setName(name);
		wish.setMemo(memo);
		wish.setOpenId(openId);
		wish.setTime(new Date());
		wishDao.add(wish);
	}

	@RequestMapping(value = "/getAll", method = RequestMethod.GET)
	@ResponseBody
	public List<Wish> getAll(HttpServletRequest request, HttpServletResponse response) {
		List<Wish> result = wishDao.getAll();
		return result;
	}
}

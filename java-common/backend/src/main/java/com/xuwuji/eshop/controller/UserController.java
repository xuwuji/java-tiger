package com.xuwuji.eshop.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuwuji.eshop.db.dao.UserDao;
import com.xuwuji.eshop.model.User;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	@Autowired
	private UserDao userDao;

	@RequestMapping(value = "/get", method = RequestMethod.GET)
	@ResponseBody
	public User getByOpenId(HttpServletRequest request, HttpServletResponse response) {
		String openId = request.getParameter("openId");
		String wechatId = request.getParameter("wechatId");
		User user = new User();
		System.out.println(openId);
		if (openId != null && !openId.isEmpty()) {
			user.setOpenId(openId);
		}
		if (wechatId != null && !wechatId.isEmpty()) {
			user.setWechatId(wechatId);
		}
		user = userDao.getByCondition(user);
		return user;
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	@ResponseBody
	public void update(HttpServletRequest request, HttpServletResponse response) {
		String openId = request.getParameter("openId");
		String state = request.getParameter("state");
		double bonusAmount = 0;
		if (request.getParameter("bonusAmount") != null && !request.getParameter("bonusAmount").isEmpty()) {
			bonusAmount = Double.valueOf(request.getParameter("bonusAmount"));
		}
		User user = new User();
		user.setOpenId(openId);
		user.setState(state);
		user.setBonusAmount(bonusAmount);
		userDao.update(user);
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	@ResponseBody
	public void add(HttpServletRequest request, HttpServletResponse response) {
		String openId = request.getParameter("openId");
		String wechatId = request.getParameter("wechatId");
		User user = new User();
		if (openId != null && !openId.isEmpty()) {
			user.setOpenId(openId);
		}
		if (wechatId != null && !wechatId.isEmpty()) {
			user.setWechatId(wechatId);
		}
		userDao.add(user);
	}

}

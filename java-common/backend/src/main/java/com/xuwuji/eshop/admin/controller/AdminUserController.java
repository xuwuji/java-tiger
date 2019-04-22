package com.xuwuji.eshop.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.xuwuji.eshop.db.dao.UserDao;
import com.xuwuji.eshop.model.User;

@Controller
@RequestMapping(value = "/admin/user")
public class AdminUserController {
	@Autowired
	private UserDao userDao;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("/eshop/user");
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public void add(HttpServletRequest request, HttpServletResponse response) {
		String openId = request.getParameter("openId");
		String wechatId = request.getParameter("wechatId");
		String state = request.getParameter("state");
		double bonusAmount = Double.valueOf(request.getParameter("bonusAmount"));
		User user = new User();
		user.setBonusAmount(bonusAmount);
		user.setOpenId(openId);
		user.setState(state);
		user.setWechatId(wechatId);
		userDao.add(user);
	}

	@RequestMapping(value = "/disable", method = RequestMethod.GET)
	@ResponseBody
	public void disable(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		System.out.println(id);
		User user = new User();
		user.setId(Integer.valueOf(id));
		user.setState("-1");
		userDao.updateState(user);
	}

	@RequestMapping(value = "/reActive", method = RequestMethod.GET)
	@ResponseBody
	public void reActive(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		User user = new User();
		user.setId(Integer.valueOf(id));
		user.setState("1");
		userDao.updateState(user);
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public void update(HttpServletRequest request, HttpServletResponse response) {
		String openId = request.getParameter("openId");
		String wechatId = request.getParameter("wechatId");
		String state = request.getParameter("state");
		double bonusAmount = Double.valueOf(request.getParameter("bonusAmount"));
		User user = new User();
		user.setBonusAmount(bonusAmount);
		user.setOpenId(openId);
		user.setState(state);
		user.setWechatId(wechatId);
		userDao.update(user);
	}

	@RequestMapping(value = "/getAll", method = RequestMethod.GET)
	@ResponseBody
	public List<User> getAll(HttpServletRequest request, HttpServletResponse response) {
		List<User> list = new ArrayList<User>();
		list = userDao.getAll();
		return list;
	}
}

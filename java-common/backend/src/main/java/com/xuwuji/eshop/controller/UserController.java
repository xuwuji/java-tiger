package com.xuwuji.eshop.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
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
import com.xuwuji.eshop.util.TimeUtil;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	@Autowired
	private UserDao userDao;

	@RequestMapping(value = "/get", method = RequestMethod.GET)
	@ResponseBody
	public User get(HttpServletRequest request, HttpServletResponse response) {
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
	public void update(HttpServletRequest request, HttpServletResponse response) throws ParseException {
		String openId = request.getParameter("openId");
		String state = request.getParameter("state");
		String level = request.getParameter("level");
		String membershipFirstDay = request.getParameter("membershipFirstDay");
		double bonusAmount = 0;
		if (request.getParameter("bonusAmount") != null && !request.getParameter("bonusAmount").isEmpty()) {
			bonusAmount = Double.valueOf(request.getParameter("bonusAmount"));
		}
		double totalPay = 0;
		if (request.getParameter("totalPay") != null && !request.getParameter("totalPay").isEmpty()) {
			totalPay = Double.valueOf(request.getParameter("totalPay"));
		}
		double amountAfterMSFD = 0;
		if (request.getParameter("amountAfterMSFD") != null && !request.getParameter("amountAfterMSFD").isEmpty()) {
			amountAfterMSFD = Double.valueOf(request.getParameter("amountAfterMSFD"));
		}
		Date msfd = TimeUtil.stringToDate(membershipFirstDay);
		User user = new User();
		user.setOpenId(openId);
		user.setState(state);
		user.setLevel(level);
		user.setTotalPay(totalPay);
		user.setBonusAmount(bonusAmount);
		user.setMembershipFirstDay(msfd);
		user.setAmountAfterMSFD(amountAfterMSFD);
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

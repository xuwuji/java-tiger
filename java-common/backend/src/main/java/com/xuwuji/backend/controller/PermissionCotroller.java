package com.xuwuji.backend.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xuwuji.backend.dao.UserDao;
import com.xuwuji.backend.model.User;
import com.xuwuji.backend.security.EncryptUtil;

@Controller
@RequestMapping(value = "/login")
public class PermissionCotroller {

	@Autowired
	private UserDao dao;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("login");
	}

	@RequestMapping(value = "action", method = RequestMethod.POST)
	private boolean login(@RequestParam("username") String username, @RequestParam("password") String password)
			throws Exception {
		String encodePassword = EncryptUtil.decode(password);
		if (dao.getId(username, encodePassword).size() != 0) {
			return true;
		} else {
			return false;
		}
	}

	@ResponseBody
	@RequestMapping(value = "/checkStatus", method = RequestMethod.GET)
	public User checkLoginStatus(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getAttribute("user");
		return user;
	}

	@ResponseBody
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public boolean register(@RequestParam("username") String username, @RequestParam("password") String password) {
		System.out.println(username);
		String encodePassword;
		try {
			encodePassword = EncryptUtil.encode(password);
			System.out.println(encodePassword);
			if (dao.checkName(username).size() == 0) {
				dao.insert(username, encodePassword);
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}

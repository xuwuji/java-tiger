package com.xuwuji.backend.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xuwuji.backend.security.EncryptUtil;
import com.xuwuji.db.dao.UserDao;
import com.xuwuji.db.model.User;

@Controller
@RequestMapping(value = "/login")
public class PermissionCotroller {
	@Autowired
	private UserDao dao;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("login");
	}

	@ResponseBody
	@RequestMapping(value = "/action", method = RequestMethod.POST)
	private boolean login(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String encodePassword = EncryptUtil.encode(password);
		if (dao.getId(username, encodePassword).size() != 0) {
			Cookie cookie = new Cookie("backend", username + "-" + encodePassword);
			// 7 days expired
			cookie.setMaxAge(60 * 60 * 24 * 7);
			cookie.setPath("/");
			response.addCookie(cookie);
			return true;
		} else {
			return false;
		}
	}

	@ResponseBody
	@RequestMapping(value = "/checkStatus", method = RequestMethod.GET)
	public User checkLoginStatus(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getAttribute("user");
		System.out.println(user);
		return user;
	}

}

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

import com.xuwuji.backend.cache.UserStatusCacheUtil;
import com.xuwuji.backend.security.EncryptUtil;
import com.xuwuji.db.dao.UserDao;
import com.xuwuji.db.model.User;

@Controller
@RequestMapping(value = "/login")
public class PermissionCotroller {
	@Autowired
	private UserDao dao;
	@Autowired
	private UserStatusCacheUtil userCacheUtil;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("login");
	}

	@ResponseBody
	@RequestMapping(value = "/action", method = RequestMethod.POST)
	private ModelAndView login(@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("remember") String remember, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println(username);
		System.out.println(password);
		String encodePassword = EncryptUtil.encode(password);
		if (dao.getId(username, encodePassword).size() != 0) {
			userCacheUtil.setLastLogin(username);
			Cookie cookie = new Cookie("backend", username + "-" + encodePassword);
			// remember the user for next login based on cookie
			if (remember.indexOf("on") != -1) {
				// 7 days expired
				cookie.setMaxAge(60 * 60 * 24 * 7);
				cookie.setPath("/");
				response.addCookie(cookie);
			} else {
				// one hour expired
				cookie.setMaxAge(60 * 60);
				cookie.setPath("/");
				response.addCookie(cookie);
			}
			return new ModelAndView("redirect:/");
		} else {
			return new ModelAndView("login").addObject("ErrorMessage", "wrong username or password");
		}
	}

	@ResponseBody
	@RequestMapping(value = "/checkStatus", method = RequestMethod.GET)
	public User checkLoginStatus(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getAttribute("user");
		System.out.println(user);
		return user;
	}

	@ResponseBody
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		Cookie[] cookie = request.getCookies();
		for (Cookie c : cookie) {
			System.out.println("logout:" + c.getName());
			if (c.getName().equals("backend")) {
				System.out.println("match");
				c.setMaxAge(0);
				c.setValue("");
				c.setPath("/");
				response.addCookie(c);
				break;
			}
		}
		return new ModelAndView("redirect:/");
	}

}

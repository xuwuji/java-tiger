package com.xuwuji.backend.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xuwuji.backend.cache.SessionCacheUtil;
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
	@Autowired
	private SessionCacheUtil sessionCacheUtil;
	static Logger logger = Logger.getLogger(PermissionCotroller.class);

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("login");
	}

	@ResponseBody
	@RequestMapping(value = "/action", method = RequestMethod.POST)
	private ModelAndView login(@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("remember") String remember, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String encodePassword = EncryptUtil.encode(password);
		// 1.check db
		if (dao.getId(username, encodePassword).size() != 0) {

			// 2.得到此用户此次的session信息并保存到server中
			Cookie[] cookies = request.getCookies();
			String sessionId = "";
			for (Cookie c : cookies) {
				if (c.getName().equals("JSESSIONID")) {
					sessionId = c.getValue();
					sessionCacheUtil.insertSession(username, sessionId);
				}
			}
			// 3.update the last login time
			userCacheUtil.setLastLogin(username);
			// 4. set cookie to local machine
			Cookie infoCookie = new Cookie("backendInfo", username + "-" + encodePassword);
			Cookie sessionCookie = new Cookie("backendSession", username + "-" + sessionId);
			// 4.remember the user for next login based on cookie
			if (remember.indexOf("on") != -1) {
				// 7 days expired
				infoCookie.setMaxAge(60 * 60 * 24 * 7);
				infoCookie.setPath("/");
				sessionCookie.setMaxAge(60 * 60 * 24 * 7);
				sessionCookie.setPath("/");
				response.addCookie(infoCookie);
				response.addCookie(sessionCookie);
			} else {
				// one hour expired
				infoCookie.setMaxAge(60 * 60);
				infoCookie.setPath("/");
				sessionCookie.setMaxAge(60 * 60);
				sessionCookie.setPath("/");
				response.addCookie(infoCookie);
				response.addCookie(sessionCookie);
			}
			return new ModelAndView("redirect:/");
		} else {
			return new ModelAndView("login").addObject("ErrorMessage", "wrong username or password");
		}
	}

	@ResponseBody
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		Cookie[] cookie = request.getCookies();
		for (Cookie c : cookie) {
			if (c.getName().equals("backendInfo")) {
				c.setMaxAge(0);
				c.setValue("");
				c.setPath("/");
				response.addCookie(c);

			}

			if (c.getName().equals("backendSessionF")) {
				c.setMaxAge(0);
				c.setValue("");
				c.setPath("/");
				response.addCookie(c);
				sessionCacheUtil.deleteSession(c.getValue().split("-")[0]);
			}
		}
		return new ModelAndView("redirect:/");
	}

	@ResponseBody
	@RequestMapping(value = "/checkStatus", method = RequestMethod.GET)
	public String checkLoginStatus(HttpServletRequest request, HttpServletResponse response) {
		String username = (String) request.getAttribute("username");
		// 1.判断cookie有没有user，没有则没在当前机器上登陆过
		if (username == null) {
			logger.info("no user has login in this device");
			return "";
		}
		String sessionId = (String) request.getAttribute("sessionId");
		String cachedSessionId = sessionCacheUtil.getSessionId(username);
		logger.info("sessionId for this user's session:" + sessionId);
		logger.info("cached sessionId for this user:" + cachedSessionId);
		// 2.比较cookie中的session与server中的session是否一致
		// 如果不一致，说明在其他的机器上登录过此账号，那么再在这个机器上访问时，需要重新登录
		if (sessionId == null || cachedSessionId == null || !sessionId.equals(cachedSessionId)) {
			return "";
		}
		logger.info(username + " is logging in");
		userCacheUtil.setLastLogin(username);
		return username;
	}

}

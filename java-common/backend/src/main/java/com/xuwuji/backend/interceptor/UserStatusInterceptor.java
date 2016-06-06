package com.xuwuji.backend.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.xuwuji.backend.dao.UserDao;
import com.xuwuji.backend.model.User;
import com.xuwuji.backend.security.EncryptUtil;

public class UserStatusInterceptor implements HandlerInterceptor {

	@Autowired
	private UserDao dao;

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Cookie[] cookies = request.getCookies();
		System.out.println("in the interceptor");
		if (cookies != null) {
			System.out.println("checking cookie");
			for (Cookie c : cookies) {
				if (c.getName().equals("backend")) {
					String[] strs = EncryptUtil.decode(c.getValue()).split("-");
					String username = strs[0];
					String password = strs[1];
					User user = new User();
					user.setUsername(username);
					user.setPassword(password);
					if (dao.getId(username, password).size() != 0) {
						user.setId(dao.getId(username, password).get(0).getId());
						request.setAttribute("user", user);
					}
				}
			}
		}
		return true;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}

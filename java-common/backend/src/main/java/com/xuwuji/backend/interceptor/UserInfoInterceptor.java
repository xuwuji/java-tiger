package com.xuwuji.backend.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.xuwuji.db.dao.UserDao;

/**
 * interceptor to check users' status
 * 
 * check if there is an user info cookie existing.
 * 
 * @author wuxu
 *
 */
public class UserInfoInterceptor implements HandlerInterceptor {

	@Autowired
	private UserDao dao;
	static Logger logger = Logger.getLogger(UserInfoInterceptor.class);

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("in the user info interceptor...");
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equals("backendInfo")) {
					String[] strs = c.getValue().split("-");
					String username = strs[0];
					String password = strs[1];
					logger.info(username + " is trying to log...");
					if (dao.getId(username, password).size() != 0) {
						int id = dao.getId(username, password).get(0).getId();
						request.setAttribute("username", username);
						request.setAttribute("userid", id);
					}
					break;
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

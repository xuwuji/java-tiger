package com.xuwuji.backend.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.xuwuji.backend.cache.SessionCacheUtil;

/**
 * 检查此次用户操作的sessionid与redis中缓存的此用户sessionID是否一致，如果一致，说明是同一个用户在同一台机器上面操作
 * 
 * 如果不一致，说明这个用户已经在别的机器上登录过，需要重新登录
 * 
 * @author wuxu
 *
 */
public class CheckStatusInterceptor implements HandlerInterceptor {
	@Autowired
	private SessionCacheUtil sessionCacheUtil;
	static Logger logger = Logger.getLogger(CheckStatusInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("in the check status interceptor...");
		String username = (String) request.getAttribute("username");
		if (username == null) {
			// 如果没有username，则要求重新登录
			response.sendRedirect("/login/index");
		}
		String sessionId = (String) request.getAttribute("sessionId");
		String cachedSessionId = sessionCacheUtil.getSessionId(username);
		logger.info("cached session id for this user:" + cachedSessionId);
		if (!sessionId.equals(cachedSessionId)) {
			response.sendRedirect("/error/anotherLocationLogin");
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

}

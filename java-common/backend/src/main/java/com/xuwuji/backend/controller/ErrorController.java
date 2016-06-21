package com.xuwuji.backend.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping(value = "/error")
@Controller
public class ErrorController {

	@RequestMapping(value = "/anotherLocationLogin", method = RequestMethod.GET)
	public ModelAndView anotherLocationLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model = new ModelAndView("home");
		model.addObject("anotherLocationLoginMsg", "您的账号在另一处登录！");
		Cookie[] cookie = request.getCookies();
		for (Cookie c : cookie) {
			if (c.getName().equals("backendInfo")) {
				c.setMaxAge(0);
				c.setValue("");
				c.setPath("/");
				response.addCookie(c);
			}

			if (c.getName().equals("backendSession")) {
				c.setMaxAge(0);
				c.setValue("");
				c.setPath("/");
				response.addCookie(c);
			}
		}
		return model;
	}

}

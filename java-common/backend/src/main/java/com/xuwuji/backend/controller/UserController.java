package com.xuwuji.backend.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.xuwuji.db.model.User;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public ModelAndView userDetail(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getAttribute("user");
		if (user == null) {
			return new ModelAndView("redirect:/login/index");
		}
		ModelAndView model = new ModelAndView("/user/profile");
		model.addObject("username", user.getUsername());
		return model;
	}

}

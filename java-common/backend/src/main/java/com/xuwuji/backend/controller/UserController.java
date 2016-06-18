package com.xuwuji.backend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

	@RequestMapping(value = "/user/{username}", method = RequestMethod.GET)
	public ModelAndView userDetail(@PathVariable("username") String username) {

		ModelAndView model = new ModelAndView("/user/profile");
		model.addObject("username", username);
		return model;
	}

}

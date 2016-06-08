package com.xuwuji.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xuwuji.backend.security.EncryptUtil;
import com.xuwuji.db.dao.UserDao;

@Controller
@RequestMapping(value = "/register")
public class RigsterController {

	private UserDao dao = new UserDao();

	@ResponseBody
	@RequestMapping(value = "/action", method = RequestMethod.POST)
	public ModelAndView register(@RequestParam("username") String username, @RequestParam("password") String password) {
		System.out.println(username);
		String encodePassword;
		try {
			encodePassword = EncryptUtil.encode(password);
			System.out.println(encodePassword);
			if (!nameIsDuplicated(username)) {
				dao.insert(username, encodePassword);
				return new ModelAndView("welcome");
			} else {
				return new ModelAndView("failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("failed");
	}

	// check if a username has already been used
	@ResponseBody
	@RequestMapping(value = "/checkNameIsDuplicated", method = RequestMethod.GET)
	public boolean checkUsername(@RequestParam("username") String username) {
		System.out.println(username);
		return nameIsDuplicated(username);
	}

	private boolean nameIsDuplicated(String username) {
		if (dao.checkName(username).size() == 0) {
			return false;
		} else {
			return true;
		}
	}

}

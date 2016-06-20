package com.xuwuji.backend.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.xuwuji.backend.util.QiNiuService;
import com.xuwuji.common.java.util.TimeUtil;
import com.xuwuji.db.dao.UserDao;
import com.xuwuji.db.model.User;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	private static final String SpaceUrl = "http://7xpxq6.com1.z0.glb.clouddn.com/";

	@Autowired
	QiNiuService qiniuService;
	@Autowired
	UserDao userDao;

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

	/**
	 * profile image upload
	 */
	@RequestMapping(value = "/profile/img/update", method = RequestMethod.POST)
	public ModelAndView uploadImg(HttpServletRequest request, @RequestParam("img") MultipartFile file) {
		String ImageName = file.getOriginalFilename();
		int id = ((User) request.getAttribute("user")).getId();
		try {
			InputStream fileStream = file.getInputStream();
			if (qiniuService.contains(ImageName)) {
				ImageName = ImageName + "-" + TimeUtil.recurrentTime();
			}
			qiniuService.uploadImage(fileStream, ImageName);
			String imgLink = SpaceUrl + ImageName;
			userDao.updateImg(id, imgLink);
			return new ModelAndView("redirect:/user/profile");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new ModelAndView("redirect:/login/index");
	}

	@ResponseBody
	@RequestMapping(value = "/profile/img", method = RequestMethod.GET)
	public String displayImg(HttpServletRequest request) {
		User user = (User) request.getAttribute("user");
		String imgLink = userDao.checkName(user.getUsername()).get(0).getImgLink();
		return imgLink;
	}

}

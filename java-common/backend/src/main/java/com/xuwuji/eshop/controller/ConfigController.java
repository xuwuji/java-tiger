package com.xuwuji.eshop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuwuji.eshop.model.Config;

@Controller
@RequestMapping(value = "/config")
public class ConfigController {

	@RequestMapping(value = "/getBaseConfig", method = RequestMethod.GET)
	@ResponseBody
	public Config geBaseConfig(HttpServletRequest request, HttpServletResponse response) {
		Config config = new Config();
		config.setNoticeMsg("欢迎来到小柴的店～有问题欢迎在线骚扰徐小柴～");
		config.setXxcUrl("http://www.baidu.com");
		return config;
	}

}

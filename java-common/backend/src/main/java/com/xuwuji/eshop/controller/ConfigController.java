package com.xuwuji.eshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xuwuji.eshop.model.BannerItem;
import com.xuwuji.eshop.model.Config;
import com.xuwuji.eshop.util.EshopConfigUtil;

@Controller
@RequestMapping(value = "/config")
public class ConfigController {
	@Autowired
	private EshopConfigUtil eshopConfigUtil;

	@RequestMapping(value = "/getBaseConfig", method = RequestMethod.GET)
	@ResponseBody
	public eshopConfig geBaseConfig(HttpServletRequest request, HttpServletResponse response) {
		eshopConfig eshopConfig = new eshopConfig();
		eshopConfig.setNoticeMsg(eshopConfigUtil.getParam(eshopConfigUtil.noticeMsg));
		eshopConfig.setXxcUrl(eshopConfigUtil.getParam(eshopConfigUtil.xxcUrl));
		return eshopConfig;
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("/eshop/config");
	}

	@RequestMapping(value = "/getAll", method = RequestMethod.GET)
	@ResponseBody
	public List<Config> getAll(HttpServletRequest request, HttpServletResponse response) {
		return eshopConfigUtil.getAll();
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public void add(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String value = request.getParameter("value");
		eshopConfigUtil.addParam(name, value);
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public void update(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String value = request.getParameter("value");
		String id = request.getParameter("id");
		eshopConfigUtil.updateParam(name, value, id);
	}

	class eshopConfig {
		public String xxcUrl;
		public String noticeMsg;

		public String getXxcUrl() {
			return xxcUrl;
		}

		public void setXxcUrl(String xxcUrl) {
			this.xxcUrl = xxcUrl;
		}

		public String getNoticeMsg() {
			return noticeMsg;
		}

		public void setNoticeMsg(String noticeMsg) {
			this.noticeMsg = noticeMsg;
		}

	}

}

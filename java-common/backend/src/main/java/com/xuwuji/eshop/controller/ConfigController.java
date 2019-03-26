package com.xuwuji.eshop.controller;

import java.util.Arrays;
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
import com.xuwuji.eshop.util.TokenUtil;

@Controller
@RequestMapping(value = "/config")
public class ConfigController {
	@Autowired
	private EshopConfigUtil eshopConfigUtil;

	@RequestMapping(value = "/getBaseConfig", method = RequestMethod.GET)
	@ResponseBody
	public EshopConfigResponse geBaseConfig(HttpServletRequest request, HttpServletResponse response) {
		EshopConfigResponse eshopConfig = new EshopConfigResponse();
		eshopConfig.setNoticeMsg(eshopConfigUtil.getParam(eshopConfigUtil.noticeMsg));
		eshopConfig.setXxcUrl(eshopConfigUtil.getParam(eshopConfigUtil.xxcUrl));
		return eshopConfig;
	}

	@RequestMapping(value = "/getOpenId", method = RequestMethod.GET)
	@ResponseBody
	public EshopConfigResponse getOpenId(HttpServletRequest request, HttpServletResponse response) {
		EshopConfigResponse eshopConfig = new EshopConfigResponse();
		String code = request.getParameter("code");
		eshopConfig.setOpenId(TokenUtil.getOpenId(code));
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

	@SuppressWarnings("static-access")
	@RequestMapping(value = "/getPreSearch", method = RequestMethod.GET)
	@ResponseBody
	public EshopConfigResponse getPreSearch(HttpServletRequest request, HttpServletResponse response) {
		EshopConfigResponse eshopConfig = new EshopConfigResponse();
		eshopConfig.setPreSearch(Arrays.asList(eshopConfigUtil.getParam(eshopConfigUtil.PRE_SEARCH).split("/")));
		return eshopConfig;
	}
	
	@SuppressWarnings("static-access")
	@RequestMapping(value = "/getArticlePreSearch", method = RequestMethod.GET)
	@ResponseBody
	public EshopConfigResponse getArticlePreSearch(HttpServletRequest request, HttpServletResponse response) {
		EshopConfigResponse eshopConfig = new EshopConfigResponse();
		eshopConfig.setArticlePreSearch(Arrays.asList(eshopConfigUtil.getParam(eshopConfigUtil.ARTICLE_PRE_SEARCH).split("/")));
		return eshopConfig;
	}

	class EshopConfigResponse {
		public String xxcUrl;
		public String noticeMsg;
		public String openId;
		public List<String> preSearch;
		public List<String> articlePreSearch;

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

		public String getOpenId() {
			return openId;
		}

		public void setOpenId(String openId) {
			this.openId = openId;
		}

		public List<String> getPreSearch() {
			return preSearch;
		}

		public void setPreSearch(List<String> preSearch) {
			this.preSearch = preSearch;
		}

		public List<String> getArticlePreSearch() {
			return articlePreSearch;
		}

		public void setArticlePreSearch(List<String> articlePreSearch) {
			this.articlePreSearch = articlePreSearch;
		}


	}

}

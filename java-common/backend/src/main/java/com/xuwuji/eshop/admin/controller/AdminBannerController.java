package com.xuwuji.eshop.admin.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xuwuji.eshop.db.dao.BannerDao;
import com.xuwuji.eshop.model.BannerItem;

@Controller
@RequestMapping(value = "/admin/banner")
public class AdminBannerController {
	@Autowired
	private BannerDao bannerDao;
	@Autowired
	private com.xuwuji.eshop.util.EshopConfigUtil EshopConfigUtil;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("/eshop/banner");
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public void add(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String redirectUrl = request.getParameter("redirectUrl");
		String bannerId = request.getParameter("bannerId");
		String info = request.getParameter("info");
		BannerItem bannerItem = new BannerItem();
		bannerItem.setBannerId(bannerId);
		bannerItem.setImgUrl(EshopConfigUtil.getParam(EshopConfigUtil.BANNER_IMG_BASE) + bannerItem.getId() + ".jpg");
		bannerItem.setName(name);
		bannerItem.setRedirectUrl(redirectUrl);
		bannerItem.setInfo(info);
		bannerDao.add(bannerItem);
	}

	@RequestMapping(value = "/disable", method = RequestMethod.POST)
	@ResponseBody
	public void disable(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		if (type.equals("single")) {
			bannerDao.disable(id);
		} else if (type.equals("batch")) {
			List<String> ids = Arrays.asList(id.split(","));
			for (String i : ids) {
				bannerDao.disable(i);
			}
		}
	}

	@RequestMapping(value = "/reActive", method = RequestMethod.POST)
	@ResponseBody
	public void reActive(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		if (type.equals("single")) {
			bannerDao.reActive(id);
		} else if (type.equals("batch")) {
			List<String> ids = Arrays.asList(id.split(","));
			for (String i : ids) {
				bannerDao.reActive(i);
			}
		}
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public void update(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String imgUrl = request.getParameter("imgUrl");
		String redirectUrl = request.getParameter("redirectUrl");
		String bannerId = request.getParameter("bannerId");
		String id = request.getParameter("id");
		String info = request.getParameter("info");
		BannerItem bannerItem = new BannerItem();
		bannerItem.setBannerId(bannerId);
		bannerItem.setImgUrl(imgUrl);
		bannerItem.setName(name);
		bannerItem.setRedirectUrl(redirectUrl);
		bannerItem.setId(Integer.valueOf(id));
		bannerItem.setInfo(info);
		bannerDao.update(bannerItem);

	}

	@RequestMapping(value = "/getAll", method = RequestMethod.GET)
	@ResponseBody
	public List<BannerItem> getAll(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("banner/getAll");
		List<BannerItem> list = new ArrayList<BannerItem>();
		list = bannerDao.getAll();
		for (BannerItem bannerItem : list) {
			bannerItem
					.setImgUrl(EshopConfigUtil.getParam(EshopConfigUtil.BANNER_IMG_BASE) + bannerItem.getId() + ".jpg");
		}
		return list;
	}

	@RequestMapping(value = "/getById/{id}", method = RequestMethod.GET)
	@ResponseBody
	public List<BannerItem> getById(@PathVariable("id") String id, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("banner/getById");
		List<BannerItem> list = new ArrayList<BannerItem>();
		list = bannerDao.getById(id);
		for (BannerItem bannerItem : list) {
			bannerItem
					.setImgUrl(EshopConfigUtil.getParam(EshopConfigUtil.BANNER_IMG_BASE) + bannerItem.getId() + ".jpg");
		}
		return list;
	}

	@RequestMapping(value = "/getAllActive", method = RequestMethod.GET)
	@ResponseBody
	public List<BannerItem> getAllActive(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("banner/getAllActive");
		List<BannerItem> list = new ArrayList<BannerItem>();
		list = bannerDao.getAllActive();
		for (BannerItem bannerItem : list) {
			bannerItem
					.setImgUrl(EshopConfigUtil.getParam(EshopConfigUtil.BANNER_IMG_BASE) + bannerItem.getId() + ".jpg");
		}
		return list;
	}

	@RequestMapping(value = "/getActiveAllByBannerId", method = RequestMethod.POST)
	@ResponseBody
	public List<BannerItem> getActiveAllByBannerId(HttpServletRequest request, HttpServletResponse response) {
		List<BannerItem> list = new ArrayList<BannerItem>();
		String bannerId = request.getParameter("bannerId");
		list = bannerDao.getActiveAllByBannerId(bannerId);
		for (BannerItem bannerItem : list) {
			bannerItem
					.setImgUrl(EshopConfigUtil.getParam(EshopConfigUtil.BANNER_IMG_BASE) + bannerItem.getId() + ".jpg");
		}
		return list;
	}

}

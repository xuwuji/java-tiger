package com.xuwuji.eshop.admin.controller;

import java.util.ArrayList;
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

import com.xuwuji.eshop.db.dao.BrandDao;
import com.xuwuji.eshop.db.dao.PromotionDao;
import com.xuwuji.eshop.model.Brand;
import com.xuwuji.eshop.model.Promotion;
import com.xuwuji.eshop.model.PromotionType;

@Controller
@RequestMapping(value = "/admin/promotion")
public class AdminPromotionController {
	@Autowired
	private PromotionDao promotionDao;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("/eshop/promotion");
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public void add(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String target = request.getParameter("target");
		String brandId = request.getParameter("brandId");
		String categoryId = request.getParameter("categoryId");
		String amount = request.getParameter("amount");
		String reduction = request.getParameter("reduction");
		String gift = request.getParameter("gift");
		Promotion promotion = new Promotion();
		promotion.setName(name);
		promotion.setTarget(target);
		promotion.setType(type);
		promotion.setGift(gift);
		if (type.equals(PromotionType.reduceMoney.getCode())) {
			promotion.setAmount(Double.valueOf(amount));
			promotion.setReduction(Double.valueOf(reduction));
		}
		promotion.setBrandId(brandId);
		promotion.setCategoryId(categoryId);
		promotionDao.add(promotion);
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public void update(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String target = request.getParameter("target");
		String brandId = request.getParameter("brandId");
		String categoryId = request.getParameter("categoryId");
		String amount = request.getParameter("amount");
		String reduction = request.getParameter("reduction");
		String gift = request.getParameter("cougiftntry");
		Promotion promotion = new Promotion();
		promotion.setName(name);
		promotion.setTarget(target);
		promotion.setType(type);
		promotion.setGift(gift);
		promotion.setId(Integer.valueOf(id));
		if (type.equals(PromotionType.reduceMoney.getCode())) {
			promotion.setAmount(Double.valueOf(amount));
			promotion.setReduction(Double.valueOf(reduction));
		}
		promotion.setBrandId(brandId);
		promotion.setCategoryId(categoryId);
		promotionDao.update(promotion);
	}

	@RequestMapping(value = "/disable", method = RequestMethod.POST)
	@ResponseBody
	public void disable(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		promotionDao.disable(id);
	}

	@RequestMapping(value = "/reActive", method = RequestMethod.POST)
	@ResponseBody
	public void reActive(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		promotionDao.reActive(id);
	}

	@RequestMapping(value = "/getAll", method = RequestMethod.GET)
	@ResponseBody
	public List<Promotion> getAll(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Promotion/getAll");
		List<Promotion> list = new ArrayList<Promotion>();
		list = promotionDao.getAll();
		return list;
	}

}

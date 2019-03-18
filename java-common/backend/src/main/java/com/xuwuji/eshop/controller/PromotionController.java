package com.xuwuji.eshop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuwuji.eshop.db.dao.PromotionDao;
import com.xuwuji.eshop.model.Promotion;
import com.xuwuji.eshop.model.PromotionTarget;

@Controller
@RequestMapping(value = "/promotion")
public class PromotionController {
	@Autowired
	private PromotionDao promotionDao;

	@RequestMapping(value = "/getActiveAll", method = RequestMethod.GET)
	@ResponseBody
	public List<Promotion> getActiveAll(HttpServletRequest request, HttpServletResponse response) {
		List<Promotion> rules = promotionDao.getActiveAll();
		return rules;
	}

	@RequestMapping(value = "/getBrandPromotion", method = RequestMethod.GET)
	@ResponseBody
	public List<Promotion> getBrandPromotion(HttpServletRequest request, HttpServletResponse response) {
		List<Promotion> promotions = promotionDao.getActiveAll();
		List<Promotion> result = new ArrayList<Promotion>();
		for (Promotion promotion : promotions) {
			System.out.print(promotion);
			if (promotion.getTarget().equals(PromotionTarget.BRAND.getCode())) {
				result.add(promotion);
			}
		}
		return result;
	}
	
	@RequestMapping(value = "/getCategoryPromotion", method = RequestMethod.GET)
	@ResponseBody
	public List<Promotion> getCategoryPromotion(HttpServletRequest request, HttpServletResponse response) {
		List<Promotion> promotions = promotionDao.getActiveAll();
		List<Promotion> result = new ArrayList<Promotion>();
		for (Promotion promotion : promotions) {
			if (promotion.getTarget().equals(PromotionTarget.CATEGORY.getCode())) {
				result.add(promotion);
			}
		}
		return result;
	}

	@RequestMapping(value = "/getActiveAllByBrandId", method = RequestMethod.GET)
	@ResponseBody
	public List<Promotion> getActiveAllByBrandId(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response) {
		List<Promotion> rules = promotionDao.getActiveAllByBrandId(id);
		return rules;
	}

	@RequestMapping(value = "/getActiveAllByCategoryId", method = RequestMethod.GET)
	@ResponseBody
	public List<Promotion> getActiveAllByCategoryId(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response) {
		List<Promotion> rules = promotionDao.getActiveAllByCategoryId(id);
		return rules;
	}
}

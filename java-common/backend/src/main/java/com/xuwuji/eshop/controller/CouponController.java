package com.xuwuji.eshop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.TreeSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuwuji.eshop.db.dao.BrandDao;
import com.xuwuji.eshop.db.dao.CouponDao;
import com.xuwuji.eshop.model.Article;
import com.xuwuji.eshop.model.Brand;
import com.xuwuji.eshop.model.Coupon;
import com.xuwuji.eshop.util.EshopConfigUtil;

import net.sourceforge.pinyin4j.PinyinHelper;

@Controller
@RequestMapping(value = "/coupon")
public class CouponController {
	@Autowired
	private CouponDao couponDao;

	@RequestMapping(value = "/getActiveAll", method = RequestMethod.GET)
	@ResponseBody
	public List<Coupon> getActiveAll(HttpServletRequest request, HttpServletResponse response) {
		List<Coupon> list = new ArrayList<Coupon>();
		list = couponDao.getActiveAll();
		return list;
	}
}

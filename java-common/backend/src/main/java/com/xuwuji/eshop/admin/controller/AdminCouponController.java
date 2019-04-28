package com.xuwuji.eshop.admin.controller;

import java.text.ParseException;
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

import com.xuwuji.eshop.db.dao.CouponDao;
import com.xuwuji.eshop.model.Coupon;
import com.xuwuji.eshop.util.TimeUtil;

@Controller
@RequestMapping(value = "/admin/coupon")
public class AdminCouponController {
	@Autowired
	private CouponDao couponDao;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("/eshop/coupon");
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public void add(HttpServletRequest request, HttpServletResponse response) throws ParseException {
		String name = request.getParameter("name");
		double total = Double.valueOf(request.getParameter("total"));
		double reduction = Double.valueOf(request.getParameter("reduction"));
		String state = request.getParameter("state");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String type = request.getParameter("type");
		String targetUser = request.getParameter("targetUser");
		Coupon coupon = new Coupon();
		coupon.setName(name);
		coupon.setReduction(reduction);
		coupon.setTotal(total);
		coupon.setState(state);
		coupon.setStartDate(TimeUtil.stringToDate(startDate));
		coupon.setEndDate(TimeUtil.stringToDate(endDate));
		coupon.setType(type);
		coupon.setTargetUser(targetUser);
		couponDao.add(coupon);
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public void update(HttpServletRequest request, HttpServletResponse response) throws ParseException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		double total = Double.valueOf(request.getParameter("total"));
		double reduction = Double.valueOf(request.getParameter("reduction"));
		String state = request.getParameter("state");
		// String startDate = request.getParameter("startDate");
		// String endDate = request.getParameter("endDate");
		String type = request.getParameter("type");
		String targetUser = request.getParameter("targetUser");
		Coupon coupon = new Coupon();
		coupon.setId(Integer.valueOf(id));
		coupon.setName(name);
		coupon.setReduction(reduction);
		coupon.setTotal(total);
		coupon.setType(type);
		coupon.setState(state);
		coupon.setTargetUser(targetUser);
		// coupon.setStartDate(TimeUtil.stringToDate(startDate));
		// coupon.setEndDate(TimeUtil.stringToDate(endDate));
		couponDao.update(coupon);
	}

	@RequestMapping(value = "/disable", method = RequestMethod.POST)
	@ResponseBody
	public void disable(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		couponDao.disable(id);
	}

	@RequestMapping(value = "/reActive", method = RequestMethod.POST)
	@ResponseBody
	public void reActive(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		couponDao.reActive(id);
	}

	@RequestMapping(value = "/getAll", method = RequestMethod.GET)
	@ResponseBody
	public List<Coupon> getAll(HttpServletRequest request, HttpServletResponse response) {
		List<Coupon> list = new ArrayList<Coupon>();
		list = couponDao.getAll();
		return list;
	}

}

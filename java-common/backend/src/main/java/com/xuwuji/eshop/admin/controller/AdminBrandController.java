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
import com.xuwuji.eshop.model.Brand;

@Controller
@RequestMapping(value = "/admin/brand")
public class AdminBrandController {
	@Autowired
	private BrandDao brandDao;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("/eshop/brand");
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public void add(HttpServletRequest request, HttpServletResponse response) {
		String brandEN = request.getParameter("brandEN");
		String brandCN = request.getParameter("brandCN");
		String brandLevel = request.getParameter("brandLevel");
		String country = request.getParameter("country");
		Brand brand = new Brand();
		brand.setBrandCN(brandCN);
		brand.setBrandEN(brandEN);
		brand.setBrandLevel(brandLevel);
		brand.setCountry(country);
		brandDao.add(brand);
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public void update(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String brandEN = request.getParameter("brandEN");
		String brandCN = request.getParameter("brandCN");
		String brandLevel = request.getParameter("brandLevel");
		String country = request.getParameter("country");
		Brand brand = new Brand();
		brand.setId(Integer.valueOf(id));
		brand.setBrandCN(brandCN);
		brand.setBrandEN(brandEN);
		brand.setBrandLevel(brandLevel);
		brand.setCountry(country);
		brandDao.update(brand);
	}

	@RequestMapping(value = "/disable", method = RequestMethod.POST)
	@ResponseBody
	public void disable(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		// 单条删除
		if (type.equals("single")) {
			brandDao.disable(id);
		}
		// 批量删除
		else if (type.equals("batch")) {
			List<String> ids = Arrays.asList(id.split(","));
			for (String i : ids) {
				brandDao.disable(i);
			}
		}
	}

	@RequestMapping(value = "/reActive", method = RequestMethod.POST)
	@ResponseBody
	public void reActive(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		// 单条上架
		if (type.equals("single")) {
			brandDao.reActive(id);
		}
		// 批量上架
		else if (type.equals("batch")) {
			List<String> ids = Arrays.asList(id.split(","));
			for (String i : ids) {
				brandDao.reActive(i);
			}
		}
	}

	@RequestMapping(value = "/getAll", method = RequestMethod.GET)
	@ResponseBody
	public List<Brand> getAll(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Brand/getAll");
		List<Brand> list = new ArrayList<Brand>();
		list = brandDao.getAll();
		return list;
	}

}

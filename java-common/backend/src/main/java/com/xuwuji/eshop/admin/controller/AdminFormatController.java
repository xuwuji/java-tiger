package com.xuwuji.eshop.admin.controller;

import java.util.ArrayList;
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

import com.xuwuji.eshop.db.dao.FormatDao;
import com.xuwuji.eshop.db.dao.ProductDao;
import com.xuwuji.eshop.model.Format;

@Controller
@RequestMapping(value = "/admin/format")
public class AdminFormatController {

	@Autowired
	private FormatDao formatDao;
	@Autowired
	private ProductDao productDao;

	@RequestMapping(value = "index/{id}", method = RequestMethod.GET)
	public ModelAndView index(@PathVariable("id") String id, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("eshop/format").addObject("product", productDao.getById(id));
		mv.addObject("id", id);
		return mv;
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public void add(HttpServletRequest request, HttpServletResponse response) {
		Format format = new Format();
		String name = request.getParameter("name");
		double price = Double.valueOf(request.getParameter("price"));
		String productId = request.getParameter("productId");
		format.setName(name);
		format.setPrice(price);
		format.setProductId(productId);
		formatDao.add(format);
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public void update(HttpServletRequest request, HttpServletResponse response) {
		Format format = new Format();
		int id = Integer.valueOf(request.getParameter("id"));
		String name = request.getParameter("name");
		double price = Double.valueOf(request.getParameter("price"));
		String productId = request.getParameter("productId");
		format.setId(id);
		format.setName(name);
		format.setPrice(price);
		format.setProductId(productId);
		formatDao.update(format);
	}

	@RequestMapping(value = "/disable", method = RequestMethod.POST)
	@ResponseBody
	public void disable(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		formatDao.disable(id);
	}

	@RequestMapping(value = "/reActive", method = RequestMethod.POST)
	@ResponseBody
	public void reActive(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		formatDao.reActive(id);
	}

	@RequestMapping(value = "/getAllByProductId/{id}", method = RequestMethod.GET)
	@ResponseBody
	public List<Format> getAllByProductId(@PathVariable("id") String id, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("format/getAllByProductId");
		List<Format> list = new ArrayList<Format>();
		list = formatDao.getAllByProductId(id);
		return list;
	}

	@RequestMapping(value = "/getActiveByProductId/{id}", method = RequestMethod.GET)
	@ResponseBody
	public List<Format> getActiveByProductId(@PathVariable("id") String id, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("format/getActiveByProductId");
		List<Format> list = new ArrayList<Format>();
		list = formatDao.getActiveByProductId(id);
		return list;
	}

}

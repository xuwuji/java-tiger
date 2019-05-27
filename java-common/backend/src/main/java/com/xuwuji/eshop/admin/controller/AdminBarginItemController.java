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

import com.xuwuji.eshop.db.dao.BarginItemDao;
import com.xuwuji.eshop.model.BarginItem;

@Controller
@RequestMapping(value = "/admin/barginItem")
public class AdminBarginItemController {

	@Autowired
	private BarginItemDao barginItemDao;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("/eshop/barginItem");
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public void add(HttpServletRequest request, HttpServletResponse response) {
		String productId = request.getParameter("productId");
		String formatId = request.getParameter("formatId");
		String categoryId = request.getParameter("categoryId");
		String name = request.getParameter("name");
		String stageOnePeople = request.getParameter("stageOnePeople");
		String stageOnePrice = request.getParameter("stageOnePrice");
		String stageTwoPeople = request.getParameter("stageTwoPeople");
		String stageTwoPrice = request.getParameter("stageTwoPrice");
		String lastHour = request.getParameter("lastHour");
		String price = request.getParameter("price");
		BarginItem barginItem = new BarginItem();
		barginItem.setProductId(productId);
		barginItem.setFormatId(formatId);
		barginItem.setCategoryId(categoryId);
		barginItem.setStageOnePeople(Integer.valueOf(stageOnePeople));
		barginItem.setStageOnePrice(Double.valueOf(stageOnePrice));
		barginItem.setStageTwoPeople(Integer.valueOf(stageTwoPeople));
		barginItem.setStageTwoPrice(Double.valueOf(stageTwoPrice));
		barginItem.setPrice(Double.valueOf(price));
		barginItem.setLastHour(Integer.valueOf(lastHour));
		barginItem.setName(name);
		barginItemDao.add(barginItem);
	}

	@RequestMapping(value = "/disable", method = RequestMethod.POST)
	@ResponseBody
	public void disable(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		barginItemDao.disable(id);
	}

	@RequestMapping(value = "/reActive", method = RequestMethod.POST)
	@ResponseBody
	public void reActive(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		barginItemDao.reActive(id);
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public void update(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String stageOnePeople = request.getParameter("stageOnePeople");
		String stageOnePrice = request.getParameter("stageOnePrice");
		String stageTwoPeople = request.getParameter("stageTwoPeople");
		String stageTwoPrice = request.getParameter("stageTwoPrice");
		String lastHour = request.getParameter("lastHour");
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		BarginItem barginItem = new BarginItem();
		barginItem.setId(Integer.valueOf(id));
		barginItem.setStageOnePeople(Integer.valueOf(stageOnePeople));
		barginItem.setStageOnePrice(Double.valueOf(stageOnePrice));
		barginItem.setStageTwoPeople(Integer.valueOf(stageTwoPeople));
		barginItem.setStageTwoPrice(Double.valueOf(stageTwoPrice));
		barginItem.setLastHour(Integer.valueOf(lastHour));
		barginItem.setName(name);
		barginItem.setPrice(Double.valueOf(price));
		barginItemDao.update(barginItem);

	}

	@RequestMapping(value = "/getAll", method = RequestMethod.GET)
	@ResponseBody
	public List<BarginItem> getAll(HttpServletRequest request, HttpServletResponse response) {
		List<BarginItem> list = new ArrayList<BarginItem>();
		list = barginItemDao.getAll();
		return list;
	}

	@RequestMapping(value = "/getByCategoryId/{categoryId}", method = RequestMethod.GET)
	@ResponseBody
	public List<BarginItem> getByCategoryId(@PathVariable("categoryId") String categoryId, HttpServletRequest request,
			HttpServletResponse response) {
		List<BarginItem> list = new ArrayList<BarginItem>();
		list = barginItemDao.getByCategoryId(categoryId);
		return list;
	}

}

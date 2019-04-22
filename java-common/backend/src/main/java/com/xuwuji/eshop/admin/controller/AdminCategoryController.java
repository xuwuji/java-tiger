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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xuwuji.eshop.db.dao.CategoryDao;
import com.xuwuji.eshop.db.dao.ParentCategoryDao;
import com.xuwuji.eshop.model.Category;
import com.xuwuji.eshop.model.ParentCategory;

/**
 * 
 * 
 * @author xuwuji
 *
 */
@Controller
@RequestMapping(value = "/admin/category")
public class AdminCategoryController {
	@Autowired
	private CategoryDao categoryDao;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("/eshop/category");
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public void add(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String desc = request.getParameter("desc");
		String parentCategoryId = request.getParameter("parentCategoryId");
		//String imgUrl = request.getParameter("imgUrl");
		//System.out.println(imgUrl);
		//System.out.println(parentCategoryId);
		Category category = new Category();
		category.setDescription(desc);
		category.setName(name);
		//category.setImgUrl(imgUrl);
		category.setParentCategoryId(parentCategoryId);
		categoryDao.add(category);
	}

	@RequestMapping(value = "/disable", method = RequestMethod.POST)
	@ResponseBody
	public void delete(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		if (type.equals("single")) {
			categoryDao.disable(id);
		} else if (type.equals("batch")) {
			List<String> ids = Arrays.asList(id.split(","));
			for (String i : ids) {
				categoryDao.disable(i);
			}
		}
	}

	@RequestMapping(value = "/reActive", method = RequestMethod.POST)
	@ResponseBody
	public void reActive(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		if (type.equals("single")) {
			categoryDao.reActive(id);
		} else if (type.equals("batch")) {
			List<String> ids = Arrays.asList(id.split(","));
			for (String i : ids) {
				categoryDao.reActive(i);
			}
		}
	}

	@RequestMapping(value = "/disRecommend", method = RequestMethod.POST)
	@ResponseBody
	public void disRecommend(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		if (type.equals("single")) {
			categoryDao.disRecommend(id);
		} else if (type.equals("batch")) {
			List<String> ids = Arrays.asList(id.split(","));
			for (String i : ids) {
				categoryDao.disRecommend(i);
			}
		}
	}

	@RequestMapping(value = "/recommend", method = RequestMethod.POST)
	@ResponseBody
	public void recommend(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		if (type.equals("single")) {
			categoryDao.recommend(id);
		} else if (type.equals("batch")) {
			List<String> ids = Arrays.asList(id.split(","));
			for (String i : ids) {
				categoryDao.recommend(i);
			}
		}
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public void update(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String desc = request.getParameter("desc");
		String parentCategoryId = request.getParameter("parentCategoryId");
		String imgUrl = request.getParameter("imgUrl");
		Category category = new Category();
		category.setId(Integer.valueOf(id));
		category.setDescription(desc);
		category.setName(name);
		category.setImgUrl(imgUrl);
		category.setParentCategoryId(parentCategoryId);
		categoryDao.update(category);
	}

}

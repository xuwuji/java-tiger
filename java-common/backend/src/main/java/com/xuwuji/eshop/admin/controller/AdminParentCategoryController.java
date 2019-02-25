package com.xuwuji.eshop.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xuwuji.eshop.model.ParentCategory;

@Controller
@RequestMapping(value = "/admin/parentCategory")
public class AdminParentCategoryController {

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("/eshop/parentCategory");
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	@ResponseBody
	public void add(@RequestParam("name") String name, HttpServletRequest request, HttpServletResponse response) {

	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	@ResponseBody
	public void delete(@RequestParam("id") String id, @RequestParam("name") String name, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println(id);
		System.out.println(name);
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	@ResponseBody
	public void update() {

	}

	@RequestMapping(value = "/getAll", method = RequestMethod.GET)
	@ResponseBody
	public List<ParentCategory> getAll() {
		List<ParentCategory> list = new ArrayList<ParentCategory>();
		ParentCategory p1 = new ParentCategory();
		p1.setId(1);
		p1.setName("美妆");
		ParentCategory p2 = new ParentCategory();
		p2.setId(2);
		p2.setName("护肤");
		ParentCategory p3 = new ParentCategory();
		p3.setId(3);
		p3.setName("个人护理");
		ParentCategory p4 = new ParentCategory();
		p4.setId(4);
		p4.setName("母婴幼儿");
		list.add(p1);
		list.add(p2);
		list.add(p3);
		list.add(p4);
		return list;
	}

}

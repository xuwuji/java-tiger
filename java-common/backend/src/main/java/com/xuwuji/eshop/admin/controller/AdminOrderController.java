package com.xuwuji.eshop.admin.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jboss.netty.util.internal.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xuwuji.eshop.model.Category;
import com.xuwuji.eshop.model.Img;
import com.xuwuji.eshop.model.ParentCategory;

/**
 * product管理
 * 
 * @author xuwuji
 *
 */
@Controller
@RequestMapping(value = "/admin/order")
public class AdminOrderController {

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("/eshop/order");
	}

	@RequestMapping(value = "/finish", method = RequestMethod.POST)
	@ResponseBody
	public void delete(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		// 单条删除
		if (type.equals("single")) {

		}
		// 批量删除
		else if (type.equals("batch")) {
			List<String> ids = Arrays.asList(id.split(","));
			System.out.println(ids);
		}
		System.out.println(id);
	}

	@RequestMapping(value = "/deliver", method = RequestMethod.POST)
	@ResponseBody
	public void deliver(HttpServletRequest request, HttpServletResponse response) {
		String orderId = request.getParameter("orderId");
		String logisticsId = request.getParameter("logisticsId");
		String logisticsName = request.getParameter("logisticsName");
		System.out.println(orderId);
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public void update(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String memo = request.getParameter("memo");
		System.out.println(id);
		System.out.println(memo);

	}

}

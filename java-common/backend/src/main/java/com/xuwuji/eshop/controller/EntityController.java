package com.xuwuji.eshop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xuwuji.eshop.db.mapper.EntityMapper;
import com.xuwuji.eshop.model.Entity;
import com.xuwuji.eshop.util.EshopConfigUtil;

@Controller
@RequestMapping(value = "/entity")
public class EntityController {

	@Autowired
	private EntityMapper entityMapper;

	private String ENTITY_IMG_BASE;

	@SuppressWarnings("static-access")
	@Autowired
	public EntityController(EshopConfigUtil eshopConfigUtil) {
		ENTITY_IMG_BASE = eshopConfigUtil.getParam(eshopConfigUtil.ENTITY_IMG_BASE);

	}

	@RequestMapping(value = "/getActiveAll", method = RequestMethod.GET)
	@ResponseBody
	public List<Entity> getActiveAll(HttpServletRequest request, HttpServletResponse response) {
		List<Entity> list = new ArrayList<Entity>();
		list = entityMapper.getActiveAll();
		list.forEach(entity -> entity.setMainImgUrl(ENTITY_IMG_BASE + entity.getId() + ".jpg"));
		return list;
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		String entityId = request.getParameter("entityId");
		return new ModelAndView("entity/entity").addObject("entityId", entityId);
	}

}

package com.xuwuji.eshop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.xuwuji.eshop.db.dao.FormatDao;
import com.xuwuji.eshop.db.dao.ProductDao;
import com.xuwuji.eshop.db.mapper.TreasureItemMapper;
import com.xuwuji.eshop.model.Product;
import com.xuwuji.eshop.model.TreasureItem;
import com.xuwuji.eshop.util.EshopConfigUtil;

@RestController
@RequestMapping(value = "/treasureItem")
public class TreasureItemController {
	@Autowired
	private TreasureItemMapper treasureItemMapper;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private FormatDao formatDao;

	@Autowired
	private EshopConfigUtil eshopConfigUtil;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("/eshop/treasureItem");
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public void add(HttpServletRequest request) {
		String totalCount = request.getParameter("totalCount");
		String productId = request.getParameter("productId");
		String formatId = request.getParameter("formatId");
		TreasureItem treasureItem = new TreasureItem();
		treasureItem.setProductId(productId);
		treasureItem.setTotalCount(Integer.valueOf(totalCount));
		treasureItem.setCurrentCount(Integer.valueOf(totalCount) / 4);
		treasureItem.setFormatId(formatId);
		treasureItemMapper.add(treasureItem);
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void update(HttpServletRequest request) {
		String totalCount = request.getParameter("totalCount");
		String productId = request.getParameter("productId");
		String currentCount = request.getParameter("currentCount");
		String formatId = request.getParameter("formatId");
		String id = request.getParameter("id");
		TreasureItem treasureItem = new TreasureItem();
		treasureItem.setProductId(productId);
		treasureItem.setTotalCount(Integer.valueOf(totalCount));
		treasureItem.setId(Integer.valueOf(id));
		treasureItem.setFormatId(formatId);
		treasureItem.setCurrentCount(Integer.valueOf(currentCount));
		treasureItemMapper.update(treasureItem);
	}

	@RequestMapping(value = "/getAll", method = RequestMethod.GET)
	public List<TreasureItem> getAll(HttpServletRequest request) {
		return treasureItemMapper.getAll();
	}

	@RequestMapping(value = "/getActiveAll", method = RequestMethod.GET)
	public List<TreasureItem> getActiveAll(HttpServletRequest request) {
		String PRODUCT_IMG_BASE = eshopConfigUtil.getParam(eshopConfigUtil.PRODUCT_IMG_BASE);
		List<TreasureItem> list = treasureItemMapper.getActiveAll();
		for (TreasureItem t : list) {
			t.setMainImgUrl(PRODUCT_IMG_BASE + t.getProductId() + "-0.jpg");
		}
		return list;
	}

	@RequestMapping(value = "/reActive", method = RequestMethod.GET)
	public void reActive(HttpServletRequest request) {
		treasureItemMapper.reactive(request.getParameter("id"));
	}

	@RequestMapping(value = "/disable", method = RequestMethod.GET)
	public void disable(HttpServletRequest request) {
		treasureItemMapper.disable(request.getParameter("id"));
	}

	@RequestMapping(value = "/getById", method = RequestMethod.GET)
	public TreasureItem getById(HttpServletRequest request) {
		TreasureItem treasureItem = treasureItemMapper.getById(request.getParameter("id"));
		Product product = productDao.getById(treasureItem.getProductId());
		List<String> imgUrls = new ArrayList<String>();
		String PRODUCT_IMG_BASE = eshopConfigUtil.getParam(eshopConfigUtil.PRODUCT_IMG_BASE);
		for (int i = 1; i < 5; i++) {
			imgUrls.add(PRODUCT_IMG_BASE + product.getId() + "-" + i + ".jpg");
		}
		product.setImgUrls(imgUrls);
		treasureItem.setFormat(formatDao.getById(treasureItem.getFormatId()));
		treasureItem.setProduct(product);
		return treasureItem;
	}

}

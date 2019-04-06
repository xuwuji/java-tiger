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

import com.xuwuji.eshop.db.dao.ProductDao;
import com.xuwuji.eshop.db.dao.SearchHistoryDao;
import com.xuwuji.eshop.db.dao.ViewHistoryDao;
import com.xuwuji.eshop.model.Product;
import com.xuwuji.eshop.model.SearchHistory;
import com.xuwuji.eshop.model.ViewHistory;
import com.xuwuji.eshop.util.EshopConfigUtil;

@Controller
@RequestMapping(value = "/history")
public class HistoryController {
	@Autowired
	private ViewHistoryDao viewHistoryDao;
	@Autowired
	private SearchHistoryDao searchHistoryDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private EshopConfigUtil eshopConfigUtil;

	@RequestMapping(value = "/view/add", method = RequestMethod.GET)
	@ResponseBody
	public void add(HttpServletRequest request, HttpServletResponse response) {
		String openId = request.getParameter("openId");
		String productId = request.getParameter("productId");
		String categoryId = request.getParameter("categoryId");
		ViewHistory history = new ViewHistory();
		history.setOpenId(openId);
		history.setProductId(productId);
		history.setCategoryId(categoryId);
		viewHistoryDao.add(history);
	}

	@RequestMapping(value = "/view/getByOpenId", method = RequestMethod.GET)
	@ResponseBody
	public List<Product> getByOpenId(HttpServletRequest request, HttpServletResponse response) {
		List<Product> plist = new ArrayList<Product>();
		String openId = request.getParameter("openId");
		List<ViewHistory> list = new ArrayList<ViewHistory>();
		list = viewHistoryDao.getAllByOpenId(openId);
		if (list.size() > 20) {
			list = list.subList(0, 20);
		}
		for (ViewHistory history : list) {
			String productId = history.getProductId();
			Product product = productDao.getById(productId);
			if (product.getMainImgUrl() == null || product.getMainImgUrl().isEmpty()) {
				String mainImgUrl = eshopConfigUtil.getParam(eshopConfigUtil.PRODUCT_IMG_BASE) + product.getId()
						+ "-0.jpg";
				product.setMainImgUrl(mainImgUrl);
			}
			plist.add(product);
		}
		return plist;
	}

	@RequestMapping(value = "/search/add", method = RequestMethod.GET)
	@ResponseBody
	public void addSearchKw(HttpServletRequest request, HttpServletResponse response) {
		String openId = request.getParameter("openId");
		String kw = request.getParameter("kw");
		SearchHistory history = new SearchHistory();
		history.setOpenId(openId);
		history.setKw(kw);
		searchHistoryDao.add(history);
	}

	@RequestMapping(value = "/search/getHotKW", method = RequestMethod.GET)
	@ResponseBody
	public List<String> getHotSearchKW(HttpServletRequest request, HttpServletResponse response) {
		return null;
	}

}

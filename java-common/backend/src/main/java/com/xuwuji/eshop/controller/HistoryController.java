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

import com.xuwuji.eshop.db.dao.HistoryDao;
import com.xuwuji.eshop.db.dao.ProductDao;
import com.xuwuji.eshop.model.History;
import com.xuwuji.eshop.model.Product;
import com.xuwuji.eshop.util.EshopConfigUtil;

@Controller
@RequestMapping(value = "/history")
public class HistoryController {
	@Autowired
	private HistoryDao historyDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private EshopConfigUtil eshopConfigUtil;

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	@ResponseBody
	public void add(HttpServletRequest request, HttpServletResponse response) {
		String openId = request.getParameter("openId");
		String productId = request.getParameter("productId");
		String categoryId = request.getParameter("categoryId");
		History history = new History();
		history.setOpenId(openId);
		history.setProductId(productId);
		history.setCategoryId(categoryId);
		historyDao.add(history);
	}

	@RequestMapping(value = "/getByOpenId", method = RequestMethod.GET)
	@ResponseBody
	public List<Product> getByOpenId(HttpServletRequest request, HttpServletResponse response) {
		List<Product> plist = new ArrayList<Product>();
		String openId = request.getParameter("openId");
		List<History> list = new ArrayList<History>();
		list = historyDao.getAllByOpenId(openId);
		if (list.size() > 20) {
			list = list.subList(0, 20);
		}
		for (History history : list) {
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

}

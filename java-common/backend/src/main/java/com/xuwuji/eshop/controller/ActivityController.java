package com.xuwuji.eshop.controller;

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

import com.xuwuji.eshop.db.dao.ProductDao;
import com.xuwuji.eshop.model.ActivityEnum;
import com.xuwuji.eshop.model.Product;
import com.xuwuji.eshop.util.EshopConfigUtil;

@Controller
@RequestMapping(value = "/activity")
public class ActivityController {
	@Autowired
	private ProductDao productDao;

	@Autowired
	private EshopConfigUtil eshopConfigUtil;

	@RequestMapping(value = "/getRankByType", method = RequestMethod.GET)
	@ResponseBody
	public List<Product> getByActivity(@RequestParam("type") String type, HttpServletRequest request,
			HttpServletResponse response) {
		List<Product> products = new ArrayList<Product>();
		if (type.equals(ActivityEnum.TOP.getCode())) {
			products = productDao.getRankByTop();
		} else if (type.equals(ActivityEnum.POPULAR.getCode())) {
			List<String> ids = Arrays.asList(eshopConfigUtil.getParam(eshopConfigUtil.POPULAR_PRODUCTS).split("/"));
			for (String id : ids) {
				products.add(productDao.getById(id));
			}
		}
		String PRODUCT_IMG_BASE = eshopConfigUtil.getParam(eshopConfigUtil.PRODUCT_IMG_BASE);
		for (Product product : products) {
			String mainImgUrl = PRODUCT_IMG_BASE + product.getId() + "-0.jpg";
			product.setMainImgUrl(mainImgUrl);
		}
		return products;
	}
}

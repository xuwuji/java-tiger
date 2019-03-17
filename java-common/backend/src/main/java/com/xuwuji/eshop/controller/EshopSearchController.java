package com.xuwuji.eshop.controller;

import java.util.ArrayList;
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
import com.xuwuji.eshop.model.Product;
import com.xuwuji.eshop.model.SortEnum;
import com.xuwuji.eshop.util.EshopConfigUtil;
import com.xuwuji.eshop.util.ProductUtil;

@Controller
@RequestMapping(value = "/search")
public class EshopSearchController {
	@Autowired
	private ProductDao productDao;

	@Autowired
	private ProductUtil productUtil;

	@Autowired
	private EshopConfigUtil eshopConfigUtil;

	@RequestMapping(value = "/keyword", method = RequestMethod.GET)
	@ResponseBody
	public List<Product> getProductsByKeyword(@RequestParam("kw") String kw, @RequestParam("sort") String sort,
			HttpServletRequest request, HttpServletResponse response) {
		List<Product> products = new ArrayList<Product>();
		kw = kw.replace(" ", "");
		if (kw.isEmpty() || kw.equals("")) {
			return products;
		} else {
			products = productDao.getActiveByKW(kw);
			String PRODUCT_IMG_BASE = eshopConfigUtil.getParam(eshopConfigUtil.PRODUCT_IMG_BASE);
			for (Product product : products) {
				String mainImgUrl = PRODUCT_IMG_BASE + product.getId() + "-0.jpg";
				product.setMainImgUrl(mainImgUrl);
			}
			SortEnum sortRequset = SortEnum.getByCode(sort);
			products = productUtil.sort(products, sortRequset);
			return products;
		}

	}

}

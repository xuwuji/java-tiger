package com.xuwuji.eshop.admin.controller;

import java.util.Arrays;
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

import com.xuwuji.eshop.db.dao.ProductDao;
import com.xuwuji.eshop.model.Product;

/**
 * product管理
 * 
 * @author xuwuji
 *
 */
@Controller
@RequestMapping(value = "/admin/product")
public class AdminProductController {

	@Autowired
	private ProductDao productDao;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("/eshop/product");
	}

	@RequestMapping(value = "/getDetailByCategory/{id}", method = RequestMethod.GET)
	@ResponseBody
	public List<Product> getDetailByCategory(@PathVariable("id") String id, HttpServletRequest request,
			HttpServletResponse response) {
		return productDao.getDetailByCategory(id);
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public void add(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String desc = request.getParameter("desc");
		String price = request.getParameter("price");
		String inventory = request.getParameter("inventory");
		String salesCount = request.getParameter("salesCount");
		String mainImgUrl = request.getParameter("mainImgUrl");
		String parentCategoryId = request.getParameter("parentCategoryId");
		String categoryId = request.getParameter("categoryId");
		String brandNameCN = request.getParameter("brandNameCN");
		String brandNameEN = request.getParameter("brandNameEN");
		Product product = new Product();
		product.setName(name);
		product.setDescription(desc);
		product.setParentCategoryId(parentCategoryId);
		product.setPrice(Double.valueOf(price));
		product.setSalesCount(Integer.valueOf(salesCount));
		product.setInventory(Integer.valueOf(inventory));
		product.setBrandNameCN(brandNameCN);
		product.setBrandNameEN(brandNameEN);
		product.setCategoryId(categoryId);
		product.setMainImgUrl(mainImgUrl);
		System.out.print(product);
		productDao.add(product);
	}

	@RequestMapping(value = "/disable", method = RequestMethod.POST)
	@ResponseBody
	public void delete(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		// 单条下架
		if (type.equals("single")) {
			productDao.disable(id);
		}
		// 批量下架
		else if (type.equals("batch")) {
			List<String> ids = Arrays.asList(id.split(","));
			for (String i : ids) {
				productDao.disable(i);
			}
		}
		System.out.println(id);
	}

	@RequestMapping(value = "/reActive", method = RequestMethod.POST)
	@ResponseBody
	public void reActive(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		// 单条上架
		if (type.equals("single")) {
			productDao.reActive(id);
		}
		// 批量上架
		else if (type.equals("batch")) {
			List<String> ids = Arrays.asList(id.split(","));
			for (String i : ids) {
				productDao.reActive(i);
			}
		}
	}

	@RequestMapping(value = "/updateBannerItem", method = RequestMethod.POST)
	@ResponseBody
	public void updateBannerItem(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		String bannerItemId = request.getParameter("bannerItemId");
		// 单条上架
		if (type.equals("single")) {
			productDao.updateBannerItem(id, bannerItemId);
		}
		// 批量上架
		else if (type.equals("batch")) {
			List<String> ids = Arrays.asList(id.split(","));
			for (String i : ids) {
				productDao.updateBannerItem(i, bannerItemId);
			}
		}
	}

	@RequestMapping(value = "/updateBrand", method = RequestMethod.POST)
	@ResponseBody
	public void updateBrand(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		String brandId = request.getParameter("brandId");
		// 单条上架
		if (type.equals("single")) {
			productDao.updateBrand(id, brandId);
		}
		// 批量上架
		else if (type.equals("batch")) {
			List<String> ids = Arrays.asList(id.split(","));
			for (String i : ids) {
				productDao.updateBrand(i, brandId);
			}
		}
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public void update(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String desc = request.getParameter("desc");
		String price = request.getParameter("price");
		String inventory = request.getParameter("inventory");
		String salesCount = request.getParameter("salesCount");
		String mainImgUrl = request.getParameter("mainImgUrl");
		String parentCategoryId = request.getParameter("parentCategoryId");
		String categoryId = request.getParameter("categoryId");
		String brandNameCN = request.getParameter("brandNameCN");
		String brandNameEN = request.getParameter("brandNameEN");
		Product product = new Product();
		product.setId(Integer.valueOf(id));
		product.setName(name);
		product.setDescription(desc);
		product.setParentCategoryId(parentCategoryId);
		product.setPrice(Double.valueOf(price));
		product.setSalesCount(Integer.valueOf(salesCount));
		product.setInventory(Integer.valueOf(inventory));
		product.setBrandNameCN(brandNameCN);
		product.setBrandNameEN(brandNameEN);
		product.setCategoryId(categoryId);
		product.setMainImgUrl(mainImgUrl);
		System.out.print(product);
		productDao.update(product);
	}

}

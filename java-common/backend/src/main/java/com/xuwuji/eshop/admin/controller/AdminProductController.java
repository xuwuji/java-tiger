package com.xuwuji.eshop.admin.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Random;

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
 * product����
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
		String hkPrice = request.getParameter("hkPrice");
		String inventory = request.getParameter("inventory");
		String salesCount = request.getParameter("salesCount");
		// String mainImgUrl = request.getParameter("mainImgUrl");
		String parentCategoryId = request.getParameter("parentCategoryId");
		String categoryId = request.getParameter("categoryId");
		// String brandNameCN = request.getParameter("brandNameCN");
		// String brandNameEN = request.getParameter("brandNameEN");
		Product product = new Product();
		product.setName(name);
		product.setDescription(desc);
		product.setParentCategoryId(parentCategoryId);
		product.setPrice(Double.valueOf(price));
		product.setHkPrice(Double.valueOf(hkPrice));
		product.setSalesCount(Integer.valueOf(salesCount));
		product.setInventory(Integer.valueOf(inventory));
		// product.setBrandNameCN(brandNameCN);
		// product.setBrandNameEN(brandNameEN);
		product.setCategoryId(categoryId);
		// product.setMainImgUrl(mainImgUrl);
		System.out.print(product);
		productDao.add(product);
	}

	@RequestMapping(value = "/disable", method = RequestMethod.POST)
	@ResponseBody
	public void delete(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		// �����¼�
		if (type.equals("single")) {
			productDao.disable(id);
		}
		// �����¼�
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
		// �����ϼ�
		if (type.equals("single")) {
			productDao.reActive(id);
		}
		// �����ϼ�
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
		// �����ϼ�
		if (type.equals("single")) {
			productDao.updateBannerItem(id, bannerItemId);
		}
		// �����ϼ�
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
		// �����ϼ�
		if (type.equals("single")) {
			productDao.updateBrand(id, brandId);
		}
		// �����ϼ�
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
		String hkPrice = request.getParameter("hkPrice");
		//System.out.print(price);
		String inventory = request.getParameter("inventory");
		String salesCount = request.getParameter("salesCount");
		String mainImgUrl = request.getParameter("mainImgUrl");
		String parentCategoryId = request.getParameter("parentCategoryId");
		String categoryId = request.getParameter("categoryId");
		String brandNameCN = request.getParameter("brandNameCN");
		String brandNameEN = request.getParameter("brandNameEN");
		String flashPrice = request.getParameter("flashPrice");
		String flashState = request.getParameter("flashState");
		Product product = new Product();
		product.setId(Integer.valueOf(id));
		product.setName(name);
		product.setDescription(desc);
		product.setParentCategoryId(parentCategoryId);
		product.setPrice(Double.valueOf(price));
		product.setHkPrice(Double.valueOf(hkPrice));
		product.setSalesCount(Integer.valueOf(salesCount));
		product.setInventory(Integer.valueOf(inventory));
		product.setBrandNameCN(brandNameCN);
		product.setBrandNameEN(brandNameEN);
		product.setCategoryId(categoryId);
		product.setMainImgUrl(mainImgUrl);
		product.setFlashPrice(Double.valueOf(flashPrice));
		product.setFlashState(flashState);
		System.out.print(product);
		productDao.update(product);
	}

	@RequestMapping(value = "/local/add", method = RequestMethod.GET)
	@ResponseBody
	public void addLocal(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String desc = request.getParameter("desc");
		String price = request.getParameter("price");
		String inventory = request.getParameter("inventory");
		String salesCount = request.getParameter("salesCount");
		// String mainImgUrl = request.getParameter("mainImgUrl");
		String parentCategoryId = request.getParameter("parentCategoryId");
		String categoryId = request.getParameter("categoryId");
		// String brandNameCN = request.getParameter("brandNameCN");
		// String brandNameEN = request.getParameter("brandNameEN");
		for (int i = 0; i < 100; i++) {
			Product product = new Product();
			product.setName("test" + i);
			product.setDescription("test" + i);
			product.setParentCategoryId("6");
			product.setPrice(10);
			product.setCategoryId("4");
			productDao.add(product);
		}
	}

	@RequestMapping(value = "/local/updatePrice", method = RequestMethod.GET)
	@ResponseBody
	public void updatePrice(HttpServletRequest request, HttpServletResponse response) {
		String categoryId = request.getParameter("categoryId");
		List<Product> products = productDao.getByCategory(categoryId);
		for (Product product : products) {
			double hkPrice = product.getHkPrice();
			double cost = hkPrice * 0.87;
			int price = 0;
			Random r = new Random();
			if (cost < 50 && hkPrice < 50) {
				price = (int) (cost / 0.5);
				product.setPrice(price);
				int inventory = r.nextInt(50) + 50;
				int salesCount = r.nextInt(100) + 50;
				product.setInventory(inventory);
				product.setSalesCount(salesCount);
				productDao.update(product);
			} else if (cost > 50 && cost < 500) {
				price = (int) (cost / 0.7) + 10;
				int inventory = r.nextInt(40) + 50;
				int salesCount = r.nextInt(50) + 50;
				product.setInventory(inventory);
				product.setSalesCount(salesCount);
				productDao.updatePrice(product.getId(), price);
			} else if (cost > 500 && cost < 1000) {
				int inventory = r.nextInt(20) + 50;
				int salesCount = r.nextInt(30) + 50;
				product.setInventory(inventory);
				product.setSalesCount(salesCount);
				price = (int) (cost / 0.75) + 10;
				productDao.updatePrice(product.getId(), price);
			} else if (cost > 1000) {
				int inventory = r.nextInt(10) + 50;
				int salesCount = r.nextInt(20) + 50;
				product.setInventory(inventory);
				product.setSalesCount(salesCount);
				price = (int) (cost / 0.8) + 10;
				productDao.updatePrice(product.getId(), price);
			}
		}
	}

}

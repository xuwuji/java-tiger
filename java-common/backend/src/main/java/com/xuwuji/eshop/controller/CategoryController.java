package com.xuwuji.eshop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuwuji.eshop.db.dao.CategoryDao;
import com.xuwuji.eshop.model.Category;
import com.xuwuji.eshop.model.ParentCategory;
import com.xuwuji.eshop.model.Product;

@Controller
@RequestMapping(value = "/category")
public class CategoryController {
	@Autowired
	private CategoryDao categoryDao;

	/**
	 * get 获取某一类别的所有产品
	 * 
	 * @param id
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/getProductsByCategory", method = RequestMethod.GET)
	@ResponseBody
	public List<Product> getProductsByCategoryId(@RequestParam("id") String id, @RequestParam("sort") String sort,
			HttpServletRequest request, HttpServletResponse response) {
		List<Product> products = new ArrayList<Product>();
		Product product1 = new Product();
		product1.setName("阿玛尼唇釉红管405");
		product1.setMainImgUrl("http://i2.bvimg.com/677237/cc92d8022c69f686.jpg");
		product1.setPrice(1.00);
		Product product2 = new Product();
		product2.setName("dior迪奥魅惑蓝金");
		product2.setMainImgUrl("http://i2.bvimg.com/677237/03f00d1fa6c72ddc.jpg");
		product2.setPrice(2);
		Product product3 = new Product();
		product3.setName("雅诗兰黛 小棕瓶密集修护眼精华眼霜 抗皱 紧致轮廓 淡眼袋去干燥");
		product3.setMainImgUrl("http://i2.bvimg.com/677237/4a2151eaf802b7f6.jpg");
		product3.setPrice(3);
		products.add(product1);
		products.add(product2);
		products.add(product3);
		products.add(product1);
		products.add(product2);
		products.add(product3);
		products.add(product1);
		products.add(product2);
		products.add(product3);
		if (sort == null || sort.equals("0")) {
			// 默认综合排序

		} else if (sort.equals("1")) {
			// 最新排序，添加时间最新在前

		} else if (sort.equals("2")) {
			// 价格排序，从低到高

		} else if (sort.equals("3")) {
			// 销量排序，从高到低
		}
		return products;
	}

	/**
	 * get 获取某一类别的所有产品
	 * 
	 * @param id
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/getProductsByCategory/{id}", method = RequestMethod.GET)
	@ResponseBody
	public List<Product> getProductsByCategoryId(@PathVariable("id") String id, HttpServletResponse response) {
		List<Product> products = new ArrayList<Product>();
		Product product1 = new Product();
		product1.setName("阿玛尼唇釉红管405");
		product1.setMainImgUrl("http://i2.bvimg.com/677237/cc92d8022c69f686.jpg");
		product1.setPrice(1.00);
		Product product2 = new Product();
		product2.setName("dior迪奥魅惑蓝金");
		product2.setMainImgUrl("http://i2.bvimg.com/677237/03f00d1fa6c72ddc.jpg");
		product2.setPrice(2);
		Product product3 = new Product();
		product3.setName("雅诗兰黛 小棕瓶密集修护眼精华眼霜 抗皱 紧致轮廓 淡眼袋去干燥");
		product3.setMainImgUrl("http://i2.bvimg.com/677237/4a2151eaf802b7f6.jpg");
		product3.setPrice(3);
		products.add(product1);
		products.add(product2);
		products.add(product3);
		products.add(product1);
		products.add(product2);
		products.add(product3);
		products.add(product1);
		products.add(product2);
		products.add(product3);
		return products;
	}

	/**
	 * 某一大类下的所有子类
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/getCategoryByParent/{id}", method = RequestMethod.GET)
	@ResponseBody
	public List<Category> getCategoryByParent(@PathVariable("id") String id, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("getCategoryByParent");
		System.out.println("id:"+id);
		List<Category> list = new ArrayList<Category>();
		list=categoryDao.getByParent(id);
		System.out.println(list);
		return list;
	}

	@RequestMapping(value = "/parentCategory", method = RequestMethod.GET)
	@ResponseBody
	public List<ParentCategory> getParentCategories(HttpServletRequest request, HttpServletResponse response) {
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

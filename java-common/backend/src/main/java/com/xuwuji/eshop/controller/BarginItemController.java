package com.xuwuji.eshop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xuwuji.eshop.db.dao.BarginItemDao;
import com.xuwuji.eshop.db.dao.CategoryDao;
import com.xuwuji.eshop.model.BarginItem;
import com.xuwuji.eshop.model.Category;
import com.xuwuji.eshop.util.EshopConfigUtil;

@Controller
@RequestMapping(value = "/barginItem")
public class BarginItemController {
	@Autowired
	private BarginItemDao barginItemDao;
	@Autowired
	private EshopConfigUtil eshopConfigUtil;
	@Autowired
	private CategoryDao categoryDao;

	private static HashMap<Integer, String> categoryNameMap = new HashMap<Integer, String>();

	/**
	 * 用户查看自己的砍价
	 * 
	 * 在查看时，首先判断是不是已经超时了，从而更改状态
	 * 
	 * 这样就省去了定时扫描的功能
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/getBarginData", method = RequestMethod.GET)
	@ResponseBody
	public List<BarginData> getBarginData(HttpServletRequest request, HttpServletResponse response) {
		loadCategoryNameMap();
		List<BarginItem> allItems = barginItemDao.getAll();
		List<BarginData> result = new ArrayList<BarginData>();
		String PRODUCT_IMG_BASE = eshopConfigUtil.getParam(eshopConfigUtil.PRODUCT_IMG_BASE);
		for (BarginItem barginItem : allItems) {
			boolean match = false;
			barginItem.setProductImg(PRODUCT_IMG_BASE + barginItem.getProductId() + "-0.jpg");
			String categoryId = barginItem.getCategoryId();
			for (BarginData barginData : result) {
				if (barginData.getCategoryId().equals(categoryId)) {
					barginData.getItems().add(barginItem);
					match = true;
					continue;
				}
			}
			if (!match) {
				BarginData barginData = new BarginData();
				barginData.setCategoryId(categoryId);
				barginData.setCategoryName(categoryNameMap.get(Integer.valueOf(categoryId)));
				barginData.getItems().add(barginItem);
				result.add(barginData);
			}
		}
		return result;
	}

	@RequestMapping(value = "/getBarginDataByCategoryId", method = RequestMethod.GET)
	@ResponseBody
	public List<BarginItem> getBarginDataByCategoryId(HttpServletRequest request, HttpServletResponse response) {
		String categoryId = request.getParameter("categoryId");
		List<BarginItem> result = barginItemDao.getActiveByCategoryId(categoryId);
		String PRODUCT_IMG_BASE = eshopConfigUtil.getParam(eshopConfigUtil.PRODUCT_IMG_BASE);
		for (BarginItem barginItem : result) {
			barginItem.setProductImg(PRODUCT_IMG_BASE + barginItem.getProductId() + "-0.jpg");
		}
		return result;
	}
	
	@RequestMapping(value = "/getById", method = RequestMethod.GET)
	@ResponseBody
	public BarginItem getById(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		BarginItem barginItem=barginItemDao.getById(id);
		return barginItem;
	}

	class BarginData {
		private String categoryId;
		private String categoryName;
		private List<BarginItem> items = new ArrayList<BarginItem>();

		public String getCategoryName() {
			return categoryName;
		}

		public void setCategoryName(String categoryName) {
			this.categoryName = categoryName;
		}

		public List<BarginItem> getItems() {
			return items;
		}

		public void setItems(List<BarginItem> items) {
			this.items = items;
		}

		public String getCategoryId() {
			return categoryId;
		}

		public void setCategoryId(String categoryId) {
			this.categoryId = categoryId;
		}
	}

	private void loadCategoryNameMap() {
		if (categoryNameMap.isEmpty()) {
			List<Category> categories = categoryDao.getAll();
			for (Category category : categories) {
				categoryNameMap.put(category.getId(), category.getName());
			}
		}
	}

}

package com.xuwuji.news.cache;

import java.util.HashMap;

import com.xuwuji.db.dao.MetaDao;
import com.xuwuji.db.model.Category;

public class CategoryCache {

	private static CategoryCache instance;

	public static HashMap<String, Integer> map = new HashMap<String, Integer>();

	private MetaDao dao;

	private CategoryCache() {
		dao = new MetaDao();
	}

	public static void init() {
		if (instance == null) {
			synchronized (CategoryCache.class) {
				if (instance == null) {
					System.out.println("Initializing the category cache...");
					instance = new CategoryCache();
					instance.refresh();
				}
			}
		}
	}

	public static CategoryCache getInstance() {
		if (instance == null) {
			System.out.println("call the init method first...");
		}
		return instance;
	}

	private void refresh() {
		for (Category c : dao.selectAll()) {
			map.put(c.getType() + c.getBigCategory() + c.getSubCategory(), c.getId());
		}
	}

	public Integer get(String str) {
		return map.get(str);
	}

}

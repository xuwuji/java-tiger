package com.xuwuji.eshop.model;

import java.util.List;

/**
 * 主分类
 * 
 * @author xuwuji
 *
 */
public class ParentCategory {

	private int id;
	private String name;
	private List<Category> categories;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

}

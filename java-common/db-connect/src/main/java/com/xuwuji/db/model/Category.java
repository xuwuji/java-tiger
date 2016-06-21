package com.xuwuji.db.model;

import java.io.Serializable;

public class Category implements Serializable {

	private int id;
	// 新闻，体育，科技...
	private String type;
	// 篮球，足球，资讯，出国....
	private String bigCategory;
	// 留学，NBA，证券新闻....
	private String subCategory;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getBigCategory() {
		return bigCategory;
	}

	public void setBigCategory(String bigCategory) {
		this.bigCategory = bigCategory;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", type=" + type + ", bigCategory=" + bigCategory + ", subCategory=" + subCategory
				+ "]";
	}

}

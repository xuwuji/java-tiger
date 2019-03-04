package com.xuwuji.eshop.model;

import java.util.List;

public class Category {

	private int id;
	private String description;
	private String name;
	private List<Product> products;
	private String parentCategoryId;
	private String imgId;
	private String imgUrl;
	// {@link ActiveStateEnum}
	private String state;
	private String recommend;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public String getParentCategoryId() {
		return parentCategoryId;
	}

	public void setParentCategoryId(String parentCategoryId) {
		this.parentCategoryId = parentCategoryId;
	}

	public String getImgId() {
		return imgId;
	}

	public void setImgId(String imgId) {
		this.imgId = imgId;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getRecommend() {
		return recommend;
	}

	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", description=" + description + ", name=" + name + ", products=" + products
				+ ", parentCategoryId=" + parentCategoryId + ", imgId=" + imgId + ", imgUrl=" + imgUrl + ", state="
				+ state + ", recommend=" + recommend + "]";
	}

}

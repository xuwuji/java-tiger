package com.xuwuji.eshop.model;

import java.util.List;

/**
 * 商品信息
 * 
 * @author xuwuji
 *
 */
public class Product {

	private int id;
	private String name;
	private String desc;
	private double price;
	// 库存
	private int inventory;
	// 销量
	private int salesCount;
	private Img mainImg;
	private String mainImgUrl;
	private String mainImgId;
	private List<Img> imgs;
	private List<String> imgIds;
	// 主分类 {@link} ParentCategory
	private String parentCategoryId;
	// 细分类 {@link} Category
	private String categoryId;
	private String brandId;

	public Product() {

	}

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

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getInventory() {
		return inventory;
	}

	public void setInventory(int inventory) {
		this.inventory = inventory;
	}

	public int getSalesCount() {
		return salesCount;
	}

	public void setSalesCount(int salesCount) {
		this.salesCount = salesCount;
	}

	public Img getMainImg() {
		return mainImg;
	}

	public void setMainImg(Img mainImg) {
		this.mainImg = mainImg;
	}

	public String getMainImgId() {
		return mainImgId;
	}

	public void setMainImgId(String mainImgId) {
		this.mainImgId = mainImgId;
	}

	public List<Img> getImgs() {
		return imgs;
	}

	public void setImgs(List<Img> imgs) {
		this.imgs = imgs;
	}

	public List<String> getImgIds() {
		return imgIds;
	}

	public void setImgIds(List<String> imgIds) {
		this.imgIds = imgIds;
	}

	public String getMainImgUrl() {
		return mainImgUrl;
	}

	public void setMainImgUrl(String mainImgUrl) {
		this.mainImgUrl = mainImgUrl;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getParentCategoryId() {
		return parentCategoryId;
	}

	public void setParentCategoryId(String parentCategoryId) {
		this.parentCategoryId = parentCategoryId;
	}

	public String getBrandId() {
		return brandId;
	}

	public void setBrandId(String brandId) {
		this.brandId = brandId;
	}

}

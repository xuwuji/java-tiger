package com.xuwuji.eshop.model;

import java.util.List;

/**
 *
 * 
 * @author xuwuji
 *
 */
public class Product {

	private int id;
	private String name;
	private String description;
	private double price;
	private int inventory;
	private int salesCount;
	private Img mainImg;
	private String mainImgUrl;
	private String mainImgId;
	private List<Img> imgs;
	private List<String> imgIds;
	private String parentCategoryId;
	private String categoryId;
	private String brandId;
	private String brandNameCN;
	private String brandNameEN;
	private String state;
	private String bannerItemId;
	private String bannerItemName;
	private String country;

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public String getBrandNameCN() {
		return brandNameCN;
	}

	public void setBrandNameCN(String brandNameCN) {
		this.brandNameCN = brandNameCN;
	}

	public String getBrandNameEN() {
		return brandNameEN;
	}

	public void setBrandNameEN(String brandNameEN) {
		this.brandNameEN = brandNameEN;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getBannerItemId() {
		return bannerItemId;
	}

	public void setBannerItemId(String bannerItemId) {
		this.bannerItemId = bannerItemId;
	}

	public String getBannerItemName() {
		return bannerItemName;
	}

	public void setBannerItemName(String bannerItemName) {
		this.bannerItemName = bannerItemName;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", description=" + description + ", price=" + price
				+ ", inventory=" + inventory + ", salesCount=" + salesCount + ", mainImg=" + mainImg + ", mainImgUrl="
				+ mainImgUrl + ", mainImgId=" + mainImgId + ", imgs=" + imgs + ", imgIds=" + imgIds
				+ ", parentCategoryId=" + parentCategoryId + ", categoryId=" + categoryId + ", brandId=" + brandId
				+ ", brandNameCN=" + brandNameCN + ", brandNameEN=" + brandNameEN + ", state=" + state
				+ ", bannerItemId=" + bannerItemId + "]";
	}

}

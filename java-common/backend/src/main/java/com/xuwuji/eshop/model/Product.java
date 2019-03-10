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
	private List<String> imgUrls;
	private String parentCategoryId;
	private String categoryId;
	private String brandId;
	private String brandNameCN;
	private String brandNameEN;
	private String state;
	private String bannerItemId;
	private String bannerItemName;
	private String country;
	private String imgUrl1;
	private String imgUrl2;
	private String imgUrl3;
	private String imgUrl4;
	private String formatId;

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

	public List<String> getImgUrls() {
		return imgUrls;
	}

	public void setImgUrls(List<String> imgUrls) {
		this.imgUrls = imgUrls;
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

	public String getImgUrl1() {
		return imgUrl1;
	}

	public void setImgUrl1(String imgUrl1) {
		this.imgUrl1 = imgUrl1;
	}

	public String getImgUrl2() {
		return imgUrl2;
	}

	public void setImgUrl2(String imgUrl2) {
		this.imgUrl2 = imgUrl2;
	}

	public String getImgUrl3() {
		return imgUrl3;
	}

	public void setImgUrl3(String imgUrl3) {
		this.imgUrl3 = imgUrl3;
	}

	public String getImgUrl4() {
		return imgUrl4;
	}

	public void setImgUrl4(String imgUrl4) {
		this.imgUrl4 = imgUrl4;
	}

	public String getFormatId() {
		return formatId;
	}

	public void setFormatId(String formatId) {
		this.formatId = formatId;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", description=" + description + ", price=" + price
				+ ", inventory=" + inventory + ", salesCount=" + salesCount + ", mainImg=" + mainImg + ", mainImgUrl="
				+ mainImgUrl + ", mainImgId=" + mainImgId + ", imgs=" + imgs + ", imgUrls=" + imgUrls
				+ ", parentCategoryId=" + parentCategoryId + ", categoryId=" + categoryId + ", brandId=" + brandId
				+ ", brandNameCN=" + brandNameCN + ", brandNameEN=" + brandNameEN + ", state=" + state
				+ ", bannerItemId=" + bannerItemId + ", bannerItemName=" + bannerItemName + ", country=" + country
				+ ", imgUrl1=" + imgUrl1 + ", imgUrl2=" + imgUrl2 + ", imgUrl3=" + imgUrl3 + ", imgUrl4=" + imgUrl4
				+ "]";
	}

}

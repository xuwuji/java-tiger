package com.xuwuji.eshop.model;

import java.util.Date;
import java.util.List;

public class Article {

	private int id;
	private String title;
	private Date time;
	private String text;
	private String referProductId;
	private String referCategoryId;
	private String imgs;
	private String tags;
	private List<String> imgUrlList;
	private List<String> tagList;
	// 0-公告，1-笔记
	private String typeId;
	private String announceStyle;
	private String mainImgUrl;
	// 放在首页时候展示的图片
	private String homeImgUrl;
	private String state;
	private Product product;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getReferProductId() {
		return referProductId;
	}

	public void setReferProductId(String referProductId) {
		this.referProductId = referProductId;
	}

	public String getImgs() {
		return imgs;
	}

	public void setImgs(String imgs) {
		this.imgs = imgs;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public List<String> getImgUrlList() {
		return imgUrlList;
	}

	public void setImgUrlList(List<String> imgUrlList) {
		this.imgUrlList = imgUrlList;
	}

	public List<String> getTagList() {
		return tagList;
	}

	public void setTagList(List<String> tagList) {
		this.tagList = tagList;
	}

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public String getAnnounceStyle() {
		return announceStyle;
	}

	public void setAnnounceStyle(String announceStyle) {
		this.announceStyle = announceStyle;
	}

	public String getMainImgUrl() {
		return mainImgUrl;
	}

	public void setMainImgUrl(String mainImgUrl) {
		this.mainImgUrl = mainImgUrl;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getReferCategoryId() {
		return referCategoryId;
	}

	public void setReferCategoryId(String referCategoryId) {
		this.referCategoryId = referCategoryId;
	}

	public String getHomeImgUrl() {
		return homeImgUrl;
	}

	public void setHomeImgUrl(String homeImgUrl) {
		this.homeImgUrl = homeImgUrl;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

}

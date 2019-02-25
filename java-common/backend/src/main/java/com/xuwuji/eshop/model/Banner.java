package com.xuwuji.eshop.model;

import java.util.List;

/**
 * 局部框
 * 
 * @author xuwuji
 *
 */
public class Banner {

	private int id;
	private String imgId;
	private String type;
	private String bannerId;
	private List<BannerItem> items;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImgId() {
		return imgId;
	}

	public void setImgId(String imgId) {
		this.imgId = imgId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getBannerId() {
		return bannerId;
	}

	public void setBannerId(String bannerId) {
		this.bannerId = bannerId;
	}

	public List<BannerItem> getItems() {
		return items;
	}

	public void setItems(List<BannerItem> items) {
		this.items = items;
	}

}

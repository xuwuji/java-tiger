package com.xuwuji.eshop.model;

/**
 * 
 * 
 * @author xuwuji
 *
 */
public class BannerItem {
	private int id;
	private String name;
	private String imgUrl;
	private String redirectUrl;
	private String state;
	private String bannerId;
	private String info;

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

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getRedirectUrl() {
		return redirectUrl;
	}

	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getBannerId() {
		return bannerId;
	}

	public void setBannerId(String bannerId) {
		this.bannerId = bannerId;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	@Override
	public String toString() {
		return "BannerItem [id=" + id + ", name=" + name + ", imgUrl=" + imgUrl + ", redirectUrl=" + redirectUrl
				+ ", state=" + state + ", bannerId=" + bannerId + ", info=" + info + "]";
	}

}

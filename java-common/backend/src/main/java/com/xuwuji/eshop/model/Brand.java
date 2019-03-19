package com.xuwuji.eshop.model;

/**
 * 
 * @author xuwuji
 *
 */
public class Brand {

	private int id;
	private String brandEN;
	private String brandCN;
	// {@link} BrandLevel
	private String brandLevel;
	private String country;
	private String countryFlagImg;
	private String state;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBrandEN() {
		return brandEN;
	}

	public void setBrandEN(String brandEN) {
		this.brandEN = brandEN;
	}

	public String getBrandCN() {
		return brandCN;
	}

	public void setBrandCN(String brandCN) {
		this.brandCN = brandCN;
	}

	public String getBrandLevel() {
		return brandLevel;
	}

	public void setBrandLevel(String brandLevel) {
		this.brandLevel = brandLevel;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCountryFlagImg() {
		return countryFlagImg;
	}

	public void setCountryFlagImg(String countryFlagImg) {
		this.countryFlagImg = countryFlagImg;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

}

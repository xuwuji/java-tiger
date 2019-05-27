package com.xuwuji.eshop.model;

/**
 * 参与砍价的条目
 * 
 * @author xuwuji
 *
 * @time May 27, 2019
 */
public class BarginItem {

	private int id;
	private String name;
	private String productId;
	private String productName;
	private String formatId;
	private String formatName;
	private String categoryId;
	private int stageOnePeople;
	private double stageOnePrice;
	private int stageTwoPeople;
	private double stageTwoPrice;
	private String state;
	private int lastHour;

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

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public String getFormatId() {
		return formatId;
	}

	public void setFormatId(String formatId) {
		this.formatId = formatId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public int getStageOnePeople() {
		return stageOnePeople;
	}

	public void setStageOnePeople(int stageOnePeople) {
		this.stageOnePeople = stageOnePeople;
	}

	public double getStageOnePrice() {
		return stageOnePrice;
	}

	public void setStageOnePrice(double stageOnePrice) {
		this.stageOnePrice = stageOnePrice;
	}

	public int getStageTwoPeople() {
		return stageTwoPeople;
	}

	public void setStageTwoPeople(int stageTwoPeople) {
		this.stageTwoPeople = stageTwoPeople;
	}

	public double getStageTwoPrice() {
		return stageTwoPrice;
	}

	public void setStageTwoPrice(double stageTwoPrice) {
		this.stageTwoPrice = stageTwoPrice;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getLastHour() {
		return lastHour;
	}

	public void setLastHour(int lastHour) {
		this.lastHour = lastHour;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getFormatName() {
		return formatName;
	}

	public void setFormatName(String formatName) {
		this.formatName = formatName;
	}

}

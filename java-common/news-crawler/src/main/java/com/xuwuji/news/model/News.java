package com.xuwuji.news.model;

public class News {

	private int id;
	private String title;
	private String link;
	// 新闻，体育，科技...
	private String type;
	// 篮球，足球，资讯，出国....
	private String bigCategory;
	// 留学，NBA，证券新闻....
	private String subCategory;
	// private String CNsubCategory;
	private String time;
	private String content;

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

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
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

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "News [id=" + id + ", title=" + title + ", link=" + link + ", type=" + type + ", bigCategory="
				+ bigCategory + ", subCategory=" + subCategory + ", time=" + time + ", content=" + content + "]";
	}

}

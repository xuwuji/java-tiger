package com.xuwuji.news.model;

public class News {

	private int id;
	private String title;
	private String link;
	// 新闻，体育，科技...
	// private String type;
	// 篮球，足球，资讯，出国....
	// private String bigCategory;
	// 留学，NBA，证券新闻....
	// private String subCategory;
	// private String CNsubCategory;
	private String time;
	private String content;
	private int typeId;

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

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	@Override
	public String toString() {
		return "News [id=" + id + ", title=" + title + ", link=" + link + ", time=" + time + ", content=" + content
				+ ", typeId=" + typeId + "]";
	}

}

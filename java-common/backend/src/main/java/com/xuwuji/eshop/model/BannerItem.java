package com.xuwuji.eshop.model;

/**
 * 
 * 
 * @author xuwuji
 *
 */
public class BannerItem {
	private int id;
	private String bannerId;
	private String imgId;
	private String keyWord;
	private Img img;

	private BannerItem(Builder builder) {
		this.id = builder.id;
		this.bannerId = builder.bannerId;
		this.imgId = builder.imgId;
		this.keyWord = builder.keyWord;
		this.img = builder.img;
	}

	public static class Builder {
		private int id;
		private String bannerId;
		private String imgId;
		private String keyWord;
		private Img img;

		public Builder id(int id) {
			this.id = id;
			return this;
		}

		public Builder bannerId(String bannerId) {
			this.bannerId = bannerId;
			return this;
		}

		public Builder imgId(String imgId) {
			this.imgId = imgId;
			return this;
		}

		public Builder keyWord(String keyWord) {
			this.keyWord = keyWord;
			return this;
		}

		public Builder img(Img img) {
			this.img = img;
			return this;
		}

		public BannerItem build() {
			return new BannerItem(this);
		}

	}

	public int getId() {
		return id;
	}

	public String getBannerId() {
		return bannerId;
	}

	public String getImgId() {
		return imgId;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public Img getImg() {
		return img;
	}

}

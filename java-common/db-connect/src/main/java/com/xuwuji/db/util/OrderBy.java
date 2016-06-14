package com.xuwuji.db.util;

public enum OrderBy {
	commentNum("commentNum"), time("time");
	private String value;

	OrderBy(String value) {
		this.value = value;
	}

	public String toString() {
		return this.value;
	}
}

package com.xuwuji.eshop.model;

import java.util.List;

public class TopUpConfig {

	private List<Topup> topupList;
	private List<String> info;

	public List<Topup> getTopupList() {
		return topupList;
	}

	public void setTopupList(List<Topup> topupList) {
		this.topupList = topupList;
	}

	public List<String> getInfo() {
		return info;
	}

	public void setInfo(List<String> info) {
		this.info = info;
	}

}

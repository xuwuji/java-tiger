package com.xuwuji.eshop.admin.manage;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.metadata.BaseRowModel;

public class BuyOrderExcel extends BaseRowModel {

	@ExcelProperty(value = "商品名称", index = 0)
	private String name;
	@ExcelProperty(value = "数量", index = 1)
	private String count;
	@ExcelProperty(value = "地址", index = 2)
	private String address;
	@ExcelProperty(value = "供货商", index = 3)
	private String vandor;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getVandor() {
		return vandor;
	}

	public void setVandor(String vandor) {
		this.vandor = vandor;
	}

}
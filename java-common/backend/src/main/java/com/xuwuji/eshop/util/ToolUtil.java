package com.xuwuji.eshop.util;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

public class ToolUtil {

	@Autowired
	private TimeUtil timeUtil;

	public String getOrderId() {
		return timeUtil.dateToString(new Date()) + String.valueOf(System.nanoTime()).substring(8);
	}

}

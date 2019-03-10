package com.xuwuji.eshop.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class TimeUtil {

	public final static String FULL_TIME_FORMAT = "yyyyMMddHHmmss";

	public String dateToString(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat(TimeUtil.FULL_TIME_FORMAT);
		String dateStr = sdf.format(date);
		return dateStr;
	}

}

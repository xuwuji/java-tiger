package com.xuwuji.eshop.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class TimeUtil {

	public final static String FULL_TIME_FORMAT = "yyyyMMddHHmmss";
	public final static String SIMPLE_TIME_FORMAT = "yyyyMMdd";

	public String dateToString(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat(TimeUtil.FULL_TIME_FORMAT);
		String dateStr = sdf.format(date);
		return dateStr;
	}

	public static Date stringToDate(String dateInput) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat(TimeUtil.SIMPLE_TIME_FORMAT);
		Date date = sdf.parse(dateInput);
		return date;
	}

}

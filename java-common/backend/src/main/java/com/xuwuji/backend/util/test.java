package com.xuwuji.backend.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class test {

	public static void main(String[] args) throws InterruptedException {
		Date dateNow = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateNowStr = sdf.format(dateNow);
		while(true){
			System.out.println(String.valueOf(System.nanoTime()).substring(8));
			Thread.sleep(1000);
		}
	
	}

}

package com.xuwuji.common.java.regrex;

import java.util.LinkedList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexUtil {

	public static void main(String[] args) {
		int count = 0;
		String regEx = "__[a-zA-Z]+";
		String str = "__hasSid";
		Pattern p = Pattern.compile(regEx);
		Matcher m = p.matcher(str);
		while (m.find()) {
			count = count + 1;
			System.out.println(m.groupCount());
			System.out.println(m.group());
		}
		System.out.println("共有 " + count + "个 ");

		for (int i = 0; i < 10; i++) {
			int s = i;
			System.out.println(s);
		}

		String imgPattern = "(http(s?):/)(/[^/]+)+" + ".(?:jpg|gif|png)";
		String imgStr = "http://img1.gtimg.com/news/pics/hv1/175/66/2082/135399055.jpg";
		for (String s : RegexUtil.find(imgStr, imgPattern)) {
			System.out.println(s);
		}
	}

	public static LinkedList<String> find(String str, String regEx) {
		LinkedList<String> result = new LinkedList<String>();
		Pattern p = Pattern.compile(regEx);
		Matcher m = p.matcher(str);
		while (m.find()) {
			result.add(m.group());
		}
		return result;
	}

}

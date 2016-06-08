package com.xuwuji.common.java.regrex;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Regex {

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
	}
}

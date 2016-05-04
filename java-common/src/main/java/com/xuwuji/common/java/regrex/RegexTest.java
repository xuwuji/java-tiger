package com.xuwuji.common.java.regrex;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexTest {

	// find all matched string from a given str
	public void find() {
		String regex = "1[a-z]+[0-9]+";
		Pattern pattern = Pattern.compile(regex);
		String str = "1a23421c";
		Matcher matcher = pattern.matcher(str);
		while (matcher.find()) {
			String s = matcher.group();
			System.out.println(s);
		}
	}

	// replace all matched string from a given str
	public void replace() {
		String regex = "1[a-z]+[0-9]+";
		String str = "1a23421c";
		// use replaceAll(String regex, String replacement) or
		// replaceFirst(String regex, String replacement) method when using
		// regex
		str = str.replaceAll(regex, "xxx");
		System.out.println(str);
	}

	public static void main(String[] args) {
		RegexTest test = new RegexTest();
		test.replace();
	}

}

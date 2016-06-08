package com.xuwuji.common.java.algorithm;

import java.util.HashMap;
import java.util.Map.Entry;

public class StringUtil {

	/**
	 * check the repeated rate
	 */

	public static double checkReaptedRate(String a, String b) {
		HashMap<Character, Integer> Amap = new HashMap<Character, Integer>();
		HashMap<Character, Integer> Bmap = new HashMap<Character, Integer>();
		// 1. count each character appearance in first string
		for (int i = 0; i < a.length(); i++) {
			char c = a.charAt(i);
			if (Amap.get(c) != null) {
				Amap.put(c, Amap.get(c) + 1);
			} else {
				Amap.put(c, 1);
			}
		}
		// 2. count each character appearance in second string
		for (int j = 0; j < b.length(); j++) {
			char c = b.charAt(j);
			if (Bmap.get(c) != null) {
				Bmap.put(c, Bmap.get(c) + 1);
			} else {
				Bmap.put(c, 1);
			}
		}

		int count = 0;

		// 3. sum the repeated characters' appearances
		if (a.length() >= b.length()) {
			for (Entry<Character, Integer> entry : Amap.entrySet()) {
				char c = entry.getKey();
				int Anum = entry.getValue();
				int Bnum = Bmap.get(c) != null ? Bmap.get(c) : 0;
				count = count + (Anum >= Bnum ? Bnum : Anum);
			}
			return (double) count / b.length();
		} else {
			for (Entry<Character, Integer> entry : Bmap.entrySet()) {
				char c = entry.getKey();
				int Anum = Amap.get(c) != null ? Amap.get(c) : 0;
				int Bnum = entry.getValue();
				count = count + (Anum >= Bnum ? Bnum : Anum);
			}
			return (double) count / (double) a.length();
		}
	}

	public static void main(String args[]) {
		double result = StringUtil.checkReaptedRate("国内IP运作弱爆了，看电影版《魔兽》如何狂赚中国的钱", "国内IP太弱，看《魔兽》如何在华吸金");
		System.out.println(result);
	}
}

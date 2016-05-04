package com.xuwuji.common.java.generics;

import java.util.HashMap;
import java.util.Map;

public class GenericsTest<T> {

	public <T> void test(T x) {
		System.out.println(x.getClass().getName());
	}

	public static <K, V> Map<K, V> newMap() {
		return new HashMap<K, V>();
	}

	public static void main(String[] args) {
		GenericsTest test = new GenericsTest();
		test.test("");
		Map<String, Integer> map = GenericsTest.newMap();
	}

}

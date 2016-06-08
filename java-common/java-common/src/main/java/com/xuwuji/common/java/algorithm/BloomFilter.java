package com.xuwuji.common.java.algorithm;

import java.util.BitSet;

/**
 * Check an element is in an existing list or not
 * 
 * Based on Hash Algorithm
 * 
 * Only Support String
 * 
 * @author wuxu
 *
 */
public class BloomFilter {

	private static int DEFAULT_SZIE = 2 << 24;
	private BitSet set;
	private static final int[] seeds = new int[] { 3, 5, 7, 11, 13, 31, 37, 61 };

	public BloomFilter() {
		set = new BitSet(DEFAULT_SZIE);
	}

	public void add(String value) {
		if (value != null) {
			for (int seed : seeds) {
				set.set(hash(seed, value), true);
			}
		}
	}

	public boolean isContains(String value) {
		if (value == null) {
			return false;
		}
		for (int seed : seeds) {
			if (!set.get(hash(seed, value))) {
				return false;
			}
		}
		return true;
	}

	private int hash(int seed, String value) {
		int result = 0;
		int len = value.length();
		for (int i = 0; i < len; i++) {
			result = seed * result + value.charAt(i);
		}
		return (DEFAULT_SZIE - 1) & result;
	}

	public static void main(String[] args) {
		BloomFilter filter = new BloomFilter();
		filter.add("a");
		filter.add("b");
		filter.add("c");
		filter.add("d");
		System.out.println(filter.isContains("e"));
	}

}

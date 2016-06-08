package com.xuwuji.common.java.Interface;

public class A implements TestInterface {
	static int a = 2;

	public static int test() {
		int b = 0;
		while (true) {
			try {
				b++;
				// return b;
			} finally {
				if (b == 3) {
					break;
				}
			}
		}
		return b;
	}

	public static void main(String[] args) {
		System.out.println(A.test());
	}
}

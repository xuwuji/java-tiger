package com.xuwuji.common.java.exception;

public class ExceptionTest {
	private String s;

	public void test() throws NullPointerException {
		// throw new NullPointerException();
		System.out.println(s);
	}

	public void t() {
		try {
			test();
		} catch (NullPointerException e) {
			System.out.println("catch the exception here");
		}
	}

	public static void main(String[] args) {
		ExceptionTest t = new ExceptionTest();
		t.t();
	}

}

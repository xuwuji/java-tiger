package com.xuwuji.common.java.concurrent.senario.RnW;

public class Reader implements Runnable {
	private Info info;

	public Reader(Info info) {
		this.info = info;
	}

	public void run() {
		for (int i = 0; i < 10; i++) {
			System.out.printf("%s: name: %s\n", Thread.currentThread().getName(), info.getName());
		}
	}

}

package com.xuwuji.common.java.concurrent.senario.RnW;

public class Writer implements Runnable {
	private Info info;
	private String name;

	public Writer(Info info, String name) {
		this.info = info;
		this.name = name;
	}

	public void run() {
		System.out.printf("Writer: Attempt to modify the name.\n");
		info.setName(name);
		System.out.printf("Writer: name have been modified.\n");

		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

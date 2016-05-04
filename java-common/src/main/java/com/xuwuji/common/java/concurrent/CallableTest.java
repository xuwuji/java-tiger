package com.xuwuji.common.java.concurrent;

import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class CallableTest implements Callable<String> {

	public String call() throws Exception {
		return Thread.currentThread().getName();
	}

	public static void main(String[] args) {
		ExecutorService service = Executors.newCachedThreadPool();
		for (int i = 0; i < 10; i++) {
			System.out.println(service.submit(new CallableTest()));
		}
		service.shutdown();
	}

}

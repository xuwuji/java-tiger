package com.xuwuji.common.java.concurrent.scenario.queue.lock;

public class Job implements Runnable {

	private WaitingQueue queue;

	public Job(WaitingQueue queue) {
		this.queue = queue;
	}
	


	public void run() {
		System.out.printf("%s: is going to do \n", Thread.currentThread().getName());
		queue.doSth();
		System.out.printf("%s: has been finished \n", Thread.currentThread().getName());

	}

}

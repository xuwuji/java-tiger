package com.xuwuji.common.java.concurrent.scenario.queue.semaphore;

public class Job2 implements Runnable {

	private WaitingQueue2 queue;

	public Job2(WaitingQueue2 queue) {
		this.queue = queue;
	}

	public void run() {
		System.out.printf("%s: is going to do \n", Thread.currentThread().getName());
		queue.doSth();
		System.out.printf("%s: has been finished \n", Thread.currentThread().getName());

	}

}

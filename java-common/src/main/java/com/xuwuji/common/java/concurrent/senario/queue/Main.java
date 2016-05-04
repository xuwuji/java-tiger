package com.xuwuji.common.java.concurrent.senario.queue;

public class Main {

	public static void main(String[] args) {

		// Creates the print queue
		WaitingQueue printQueue = new WaitingQueue();

		// Creates ten Threads
		Thread thread[] = new Thread[10];
		for (int i = 0; i < 10; i++) {
			thread[i] = new Thread(new Job(printQueue), "Thread " + i);
		}

		// Starts the Threads
		for (int i = 0; i < 10; i++) {
			thread[i].start();
		}
	}
}

package com.xuwuji.common.java.concurrent.senario.RnW;

import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/**
 * multiple threads can read this info, but only one thread can modify this info
 * 
 * @author wuxu
 *
 */
public class Info {

	private String name = "initialized";

	private final ReadWriteLock lock;

	public Info() {
		lock = new ReentrantReadWriteLock();
	}

	public String getName() {
		lock.readLock().lock();
		lock.readLock().unlock();
		return name;
	}

	public void setName(String name) {
		lock.writeLock().lock();
		this.name = name;
		lock.writeLock().unlock();
	}

	public static void main(String[] args) {

		// Creates an object to store the prices
		Info info = new Info();

		Reader readers[] = new Reader[5];
		Thread threadsReader[] = new Thread[5];

		// Creates five readers and threads to run them
		for (int i = 0; i < 5; i++) {
			readers[i] = new Reader(info);
			threadsReader[i] = new Thread(readers[i]);
		}

		// Creates a writer and a thread to run it
		Writer writer = new Writer(info, Thread.currentThread().getName());
		Thread threadWriter = new Thread(writer);

		// Starts the threads
		for (int i = 0; i < 5; i++) {
			threadsReader[i].start();
		}
		threadWriter.start();

	}

}

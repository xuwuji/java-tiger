package com.xuwuji.common.java.concurrent.scenario.queue.lock;

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * some jobs waiting in a queue, do job one by one
 * 
 * also can make the doSth method be synchronized
 * 
 * using lock
 * 
 * @author wuxu
 *
 */
public class WaitingQueue {

	// use lock to control the operation
	private final Lock lock = new ReentrantLock();

	public WaitingQueue() {
	}

	/**
	 * When we want to implement a critical section using locks and guarantee
	 * that only one execution thread runs a block of code, we have to create a
	 * ReentrantLock object.
	 * 
	 * At the beginning of the critical section,we have to get the control of
	 * the lock using the lock() method. When a thread (A) calls this method, if
	 * no other thread has the control of the lock, the method gives the thread
	 * (A) the control of the lock and returns immediately to permit the
	 * execution of the critical section to this thread. Otherwise, if there is
	 * another thread (B) executing the critical section controlled by this
	 * lock, the lock() method puts the thread (A) to sleep until the thread (B)
	 * finishes the execution of the critical section.
	 * 
	 * At the end of the critical section, we have to use the unlock() method to
	 * free the control of the lock and allow the other threads to run this
	 * critical section. If you don't call the unlock() method at the end of the
	 * critical section, the other threads that are waiting for that block will
	 * be waiting forever, causing a deadlock situation. If you use try-catch
	 * blocks in your critical section, don't forget to put the sentence
	 * containing the unlock() method inside the finally section.
	 */

	public void doSth() {
		// get lock
		lock.lock();
		try {
			// do real things here...
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		} finally {
			lock.unlock();
		}
	}

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

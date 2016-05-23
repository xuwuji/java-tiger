package com.xuwuji.common.java.concurrent.scenario.queue.semaphore;

import java.util.concurrent.Semaphore;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * some jobs waiting in a queue, do job one by one
 * 
 * also can make the doSth method be synchronized,lock
 * 
 * this is using semaphore
 * 
 * @author wuxu
 *
 */
public class WaitingQueue2 {

	// semaphore to control how many threads can control the critical section
	private final Semaphore semaphore;

	/**
	 * When a thread wants to access one of these shared resources, first, it
	 * must acquire the semaphore. If the internal counter of the semaphore is
	 * greater than 0, the semaphore decrements the counter and allows access to
	 * the shared resource.
	 * 
	 * A counter bigger than 0 means there are free resources that can be used,
	 * so the thread can access and use one of them. Otherwise, if the counter
	 * of the semaphore is 0, the semaphore puts the thread to sleep until the
	 * counter is greater than 0.
	 * 
	 * A value of 0 in the counter means all the shared resources are used by
	 * other threads, so the thread that wants to use one of them must wait
	 * until one is free. When the thread has finished the use of the shared
	 * resource, it must release the semaphore so that the other thread can
	 * access the shared resource. That operation increases the internal counter
	 * of the semaphore.
	 */
	public WaitingQueue2() {
		// only 1 thread can use the critical section
		/**
		 * When you start the 10 threads, the rst one acquires the semaphore and
		 * gets the access to the critical section. The rest are blocked by the
		 * semaphore until the thread that has acquired it, releases it. When
		 * this occurs, the semaphore selects one of the waiting threads and
		 * gives it the access to the critical section. All the jobs print their
		 * documents, but one by one.
		 */
		semaphore = new Semaphore(1);
	}

	/**
	 * 1. First, you acquire the semaphore, with the acquire() method.
	 * 
	 * 2. Then, you do the necessary operations with the shared resource.
	 * 
	 * 3. Finally, release the semaphore with the release() method.
	 */
	public void doSth() {
		try {
			// Get the access to the semaphore. If other job is doing, this
			// thread sleep until get the access to the semaphore
			semaphore.acquire();
			// do real things here...
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		} finally {
			semaphore.release();
		}
	}

	public static void main(String[] args) {

		// Creates the print queue
		WaitingQueue2 printQueue = new WaitingQueue2();

		// Creates ten Threads
		Thread thread[] = new Thread[10];
		for (int i = 0; i < 10; i++) {
			thread[i] = new Thread(new Job2(printQueue), "Thread " + i);
		}

		// Starts the Threads
		for (int i = 0; i < 10; i++) {
			thread[i].start();
		}
	}
}

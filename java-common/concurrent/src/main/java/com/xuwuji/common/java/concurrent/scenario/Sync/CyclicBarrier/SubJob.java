package com.xuwuji.common.java.concurrent.scenario.Sync.CyclicBarrier;

import java.util.concurrent.BrokenBarrierException;
import java.util.concurrent.CyclicBarrier;

public class SubJob implements Runnable {

	/**
	 * The CyclicBarrier class is initialized with an integer number, which is
	 * the number of threads that will be synchronized in a determined point.
	 * When one of those threads arrives to the determined point, it calls the
	 * await() method to wait for the other threads. When the thread calls that
	 * method, the CyclicBarrier class blocks the thread that is sleeping until
	 * the other threads arrive. When the last thread calls the await() method
	 * of the CyclicBarrier class, it wakes up all the threads that were waiting
	 * and continues with its job.
	 * 
	 * @param job
	 */

	private CyclicBarrier barrier;

	public SubJob(CyclicBarrier barrier) {
		this.barrier = barrier;
	}

	public void run() {
		/**
		 * When one of those threads arrives to the determined point, it calls
		 * the await() method to wait for the other threads.
		 */
		try {
			System.out.printf("%s is running \n", Thread.currentThread().getName());
			Thread.sleep(1000);
			// do real things here..
			System.out.printf("%s has finished \n", Thread.currentThread().getName());
			// 记住在做完操作后，才调用 barrier.await();
			barrier.await();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (BrokenBarrierException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}

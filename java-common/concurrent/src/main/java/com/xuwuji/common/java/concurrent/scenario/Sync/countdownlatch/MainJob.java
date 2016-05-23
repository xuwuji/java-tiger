package com.xuwuji.common.java.concurrent.scenario.Sync.countdownlatch;

import java.util.concurrent.CountDownLatch;

/**
 * this is a scenario that has
 * 
 * 1. a main job
 * 
 * 2.multiple sub jobs
 * 
 * after sub jobs have done, the main job can continue to do
 * 
 * 
 * Using the CountDownLatch to control when sub jobs have all done.
 * 
 * @author wuxu
 *
 */
public class MainJob implements Runnable {

	/**
	 * The CountDownLatch mechanism is not used to protect a shared resource or
	 * a critical section. It is used to synchronize one or more threads with
	 * the execution of various tasks.
	 */
	private CountDownLatch controller;

	/**
	 * There's no way to re-initialize the internal counter of the
	 * CountDownLatch object or to modify its value. Once the counter is
	 * initialized, the only method you can use to modify its value is the
	 * countDown() method explained earlier.
	 * 
	 * @param number
	 */
	public MainJob(int number) {
		controller = new CountDownLatch(number);
	}

	public void subJobRun(String name) {
		System.out.printf("%s is running \n", name);
		controller.countDown();
	}

	public void run() {
		try {
			// wait all sub jobs to be done
			/**
			 * When the counter arrives to 0, all the calls to the await()
			 * method return immediately and all subsequent calls to the
			 * countDown() method have no effect.
			 */

			/**
			 * await(long time, TimeUnit unit): The thread will be sleeping
			 * until it's interrupted; the internal counter of CountDownLatch
			 * arrives to 0 or speci ed time passes. The TimeUnit class is an
			 * enumeration with the following constants: DAYS, HOURS,
			 * MICROSECONDS, MILLISECONDS, MINUTES, NANOSECONDS, and SECONDS.
			 */
			controller.await();
			// do main job real things here..
			System.out.printf("%s is running \n", "main job");
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void main(String[] args) {

		// Creates a main job and want to synchronize 10 sub jobs.
		MainJob mainJob = new MainJob(10);

		Thread mainThread = new Thread(mainJob);
		mainThread.start();

		// Creates 10 sub jobs
		for (int i = 0; i < 10; i++) {
			SubJob s = new SubJob(mainJob);
			Thread t = new Thread(s);
			t.start();
		}

	}

}

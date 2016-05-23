package com.xuwuji.common.java.concurrent.scenario.Sync.CyclicBarrier;

import java.util.concurrent.CyclicBarrier;

/**
 * this is a scenario that:
 * 
 * parallel computation - where multiple subtasks are involved in the
 * computation - kind of like MapReduce.
 * 
 * After sub jobs have done, the main job can continue to do
 * 
 * Divide and Conquer
 * 
 * @author wuxu
 *
 */
public class ConclusionJob implements Runnable {

	public void run() {
		try {
			// do real things here..
			System.out.printf("%s is running \n", "conclusion job");
			Thread.sleep(1000);
			System.out.printf("%s has done \n", "conclusion job");
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {

		// Creates a main job
		ConclusionJob mainJob = new ConclusionJob();

		/**
		 * The CyclicBarrier class has some points in common with the
		 * CountDownLatch class, but they also have some differences. One of the
		 * most important differences is that a CyclicBarrier object can be
		 * reset to its initial state, assigning to its internal counter the
		 * value with which it was initialized. This reset operation can be done
		 * using the reset() method of the CyclicBarrier class. When this
		 * occurs, all the threads that were waiting in the await() method
		 * receive a BrokenBarrierException exception. This exception was
		 * processed in the example presented in this recipe by printing the
		 * stack trace, but in a more complex application, it could perform some
		 * other operation, such as restarting their execution or recovering
		 * their operation at the point it was interrupted.
		 */
		CyclicBarrier barriers = new CyclicBarrier(5, mainJob);
		// create 5 sub tasks
		for (int i = 0; i < 5; i++) {
			SubJob s = new SubJob(barriers);
			Thread t = new Thread(s);
			t.start();
		}

	}

}

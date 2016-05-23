package com.xuwuji.common.java.concurrent.scenario.Sync.Phaser;

import java.util.Random;

public class Task implements Runnable {

	private MyPhaser phaser;

	public Task(MyPhaser phaser) {
		this.phaser = phaser;
	}

	public void run() {
		// 1. wait all task to be created, all tasks start together
		System.out.printf("%s is in Phase %d\n", Thread.currentThread().getName(), phaser.getPhase());
		phaser.arriveAndAwaitAdvance();
		System.out.printf("%s is in Phase %d, Running.\n", Thread.currentThread().getName(), phaser.getPhase());

		// 2.do real things here
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		phaser.arriveAndAwaitAdvance();
		Random r = new Random();
		int i = r.nextInt(2);
		// System.out.println(i);
		boolean tag;
		if (i == 0) {
			tag = false;
		} else {
			tag = true;
		}
		// 3.check, if false, stop this thread
		if (!check(tag)) {
			return;
		}
		// 4. after checking for all threads
		phaser.arriveAndDeregister();
		/**
		 * When a phaser has zero participants, it enters a state denoted by
		 * Termination. The Phaser class provides forceTermination() to change
		 * the status of the phaser and makes it enter in the Termination state
		 * independently of the number of participants registered in the phaser.
		 * This mechanism may be useful when one of the participants has an
		 * error situation, to force the termination of the phaser. When a
		 * phaser is in the Termination state, the awaitAdvance() and
		 * arriveAndAwaitAdvance() methods immediately return a negative number,
		 * instead of a positive one that returns normally. If you know that
		 * your phaser could be terminated, you should verify the return value
		 * of those methods to know if the phaser has been terminated.
		 */
	}

	public boolean check(boolean tag) {
		if (tag) {
			// do some logic here
			System.out.printf("%s is in Phase %d: checking okay \n", Thread.currentThread().getName(),
					phaser.getPhase());
			return true;
		} else {
			System.out.printf("%s is in Phase %d: checking error \n", Thread.currentThread().getName(),
					phaser.getPhase());
			// 这里说明此线程有错误，不要继续执行了，所以要从phaser中把此不用的线程给取消掉
			phaser.arriveAndDeregister();
			return false;
		}
	}

	public static void main(String[] args) {

		// Creates a Phaser with three participants
		MyPhaser phaser = new MyPhaser(3);
		// Task t=new Task(phaser);
		for (int i = 0; i < 3; i++) {
			Thread thread = new Thread(new Task(phaser));
			thread.start();
		}

		// System.out.printf("Terminated: %s\n", phaser.isTerminated());

	}

}

package com.xuwuji.common.java.concurrent.scenario.Sync.countdownlatch;

public class SubJob implements Runnable {

	private MainJob mainJob;

	public SubJob(MainJob job) {
		mainJob = job;
	}

	public void run() {

		try {
			Thread.sleep(1000);
			// do real things here..
			mainJob.subJobRun(Thread.currentThread().getName());
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.printf("%s has finished \n", Thread.currentThread().getName());
	}

}

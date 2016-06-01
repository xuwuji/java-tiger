package com.xuwuji.news.task;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class Storage {
	// store the links to be going processing
	private LinkedList<String> processingList = new LinkedList<String>();
	// store the links have been processed
	private HashSet<String> processedSet = new HashSet<String>();
	private Lock lock;

	public Storage(LinkedList<String> processingList) {
		this.processingList = processingList;
		this.lock = new ReentrantLock();

	}

	public synchronized String getLink() {
		// System.out.println("[" + Thread.currentThread().getName() + "] - is
		// trying to get link");
		// 1. if the list is empty, the task has to wait for a new link
		while (processingList.size() == 0) {
			try {
				System.out.println("[" + Thread.currentThread().getName() + "] - is waiting for the the link");
				wait();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		// 2. get the link
		String link = processingList.poll();
		System.out.println("[" + Thread.currentThread().getName() + "] - gets the link " + link);
		// 3. add the link into the processed set
		processedSet.add(link);
		// notifyAll();
		return link;
	}

	public synchronized void addLink(String link) {
		// lock.lock();
		try {
			// 1.check if this url is processed or not
			if (!processedSet.contains(link)) {
				// 2. if it is not, add this link to processing list
				System.out.println("[" + Thread.currentThread().getName() + "] -" + link + " is adding to the storage");
				processingList.push(link);
			}
		} finally {
			// lock.unlock();
		}
		notifyAll();
	}

	public int getCount() {
		lock.lock();
		try {
			return processingList.size();
		} finally {
			lock.unlock();
		}
	}

}

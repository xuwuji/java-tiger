package com.xuwuji.news.task;

import java.util.LinkedList;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class Storage {

	private LinkedList<String> initList = new LinkedList<String>();
	private Lock lock;

	public Storage(LinkedList<String> initList) {
		this.initList = initList;
		this.lock = new ReentrantLock();

	}

	private ConcurrentHashMap<String, String> map = new ConcurrentHashMap<String, String>();

	public void addLink(String link) {
		lock.lock();
		try {
			if (!initList.contains(link)) {
				System.out.println(link + " is adding to the storage");
				initList.push(link);
			}
		} finally {
			lock.unlock();
		}
	}

	public int getCount() {
		lock.lock();
		try {
			return initList.size();
		} finally {
			lock.unlock();
		}
	}

	public String getLink() {
		lock.lock();
		try {
			return initList.poll();
		} finally {
			lock.unlock();
		}
	}

	public ConcurrentHashMap<String, String> getMap() {
		return map;
	}

}

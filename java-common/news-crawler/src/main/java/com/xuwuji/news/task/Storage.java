package com.xuwuji.news.task;
import java.util.HashMap;
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

	public synchronized void put(String title, String link) {
		map.put(title, link);
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

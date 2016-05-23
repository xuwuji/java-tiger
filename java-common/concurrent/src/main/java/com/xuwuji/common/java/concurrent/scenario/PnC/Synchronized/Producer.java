package com.xuwuji.common.java.concurrent.scenario.PnC.Synchronized;

public class Producer<T> implements Runnable {
	private Storage<T> storage;

	public Producer(Storage<T> storage) {
		this.storage = storage;
	}

	@SuppressWarnings("unchecked")
	public void run() {
		for (int i = 0; i < 100; i++) {
			T object = (T) new Object();
			storage.add(object);
		}
	}

}

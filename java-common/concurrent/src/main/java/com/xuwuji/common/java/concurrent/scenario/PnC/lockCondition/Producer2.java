package com.xuwuji.common.java.concurrent.scenario.PnC.lockCondition;

public class Producer2<T> implements Runnable {
	private Storage2<T> storage;

	public Producer2(Storage2<T> storage) {
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

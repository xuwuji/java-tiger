package com.xuwuji.common.java.concurrent.scenario.PnC.Synchronized;

public class Consumer<T> implements Runnable {
	private Storage<T> storage;

	public Consumer(Storage<T> storage) {
		this.storage = storage;
	}

	public void run() {
		for (int i = 0; i < 100; i++) {
			storage.get();
		}
	}

}

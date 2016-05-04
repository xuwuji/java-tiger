package com.xuwuji.common.java.concurrent.senario.PnC;

public class Consumer<T> implements Runnable {
	private Storage<T> storage;

	public Consumer(Storage<T> storage) {
		this.storage = storage;
	}

	@SuppressWarnings("unchecked")
	public void run() {
		for (int i = 0; i < 100; i++) {
			T object = (T) new Object();
			storage.get(object);
		}

	}

}

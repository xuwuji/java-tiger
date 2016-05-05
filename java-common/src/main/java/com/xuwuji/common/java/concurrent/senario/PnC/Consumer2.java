package com.xuwuji.common.java.concurrent.senario.PnC;

public class Consumer2<T> implements Runnable {
	private Storage2<T> storage;

	public Consumer2(Storage2<T> storage) {
		this.storage = storage;
	}

	@SuppressWarnings("unchecked")
	public void run() {
		for (int i = 0; i < 100; i++) {
			storage.get();
		}

	}

}

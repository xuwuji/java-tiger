package com.xuwuji.common.java.concurrent.senario.PnC;

import java.util.LinkedList;

/**
 * storage to put data, has a maximum size
 * 
 * @author wuxu
 *
 */
public class Storage<T> {

	private LinkedList<T> space;
	private int size;

	public Storage(int size) {
		space = new LinkedList<T>();
		this.size = size;
	}

	public synchronized void add(T object) {
		while (space.size() == this.size) {
			try {
				wait();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		space.add(object);
		System.out.printf("Set: %d\n", space.size());
		notify();
	}

	public synchronized T get(T object) {
		while (space.size() == 0) {
			try {
				wait();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}

		notify();
		System.out.printf("Get: %d: %s\n", space.size(), ((LinkedList<?>) space).getLast());
		return space.removeLast();
	}

	public LinkedList<T> getSpace() {
		return space;
	}

	public void setSpace(LinkedList<T> space) {
		this.space = space;
	}

	public static void main(String[] args) {

		// Creates an event storage
		Storage<String> storage = new Storage(10);
		// Creates a Producer and a Thread to run it
		Producer<String> producer = new Producer(storage);
		Thread thread1 = new Thread(producer);

		// Creates a Consumer and a Thread to run it
		Consumer<String> consumer = new Consumer(storage);
		Thread thread2 = new Thread(consumer);

		// Starts the thread
		thread2.start();
		thread1.start();
	}
}

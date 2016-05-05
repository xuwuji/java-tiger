package com.xuwuji.common.java.concurrent.senario.PnC;

import java.util.LinkedList;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * using lock condition to control
 * 
 * @author wuxu
 *
 * @param <T>
 */
public class Storage2<T> {

	private Lock lock;
	// space目前含有多少
	private Condition occupied;
	// space还有多少空余位置
	private Condition vacancy;
	private LinkedList<T> space;
	private int size;

	public Storage2(int size) {
		space = new LinkedList<T>();
		lock = new ReentrantLock();
		occupied = lock.newCondition();
		vacancy = lock.newCondition();
		this.size = size;

	}

	/**
	 * 
	 * A lock may be associated with one or more conditions. These conditions
	 * are declared in the Condition interface. The purpose of these conditions
	 * is to allow threads to have control of a lock and check whether a
	 * condition is true or not and, if it's false, be suspended until another
	 * thread wakes them up. The Condition interface provides the mechanisms to
	 * suspend a thread and to wake up a suspended thread.
	 * 
	 * All the Condition objects are associated with a lock and are created
	 * using the newCondition() method declared in the Lock interface.
	 * 
	 * Before we can do any operation with a condition, you have to have the
	 * control of the lock associated with the condition, so the operations with
	 * conditions must be in a block of code that begins with a call to a lock()
	 * method of a Lock object and ends with an unlock() method of the same Lock
	 * object.
	 */
	public T get() {
		lock.lock();
		try {
			// 由于space为空，occupied需要等待
			while (space.size() == 0) {
				// 此时此线程被挂起，其他线程拿到锁
				/**
				 * 其他某一个线程拿到锁后，此时可以调用add方法往space里面添加data，添加后在add方法里调用occupied.
				 * signalAll();
				 * 
				 * 这时因为occupied.await()而被挂起的本线程又被重新唤醒了，知道space里面有东西了，就跳出while循环，
				 * 接着往下进行去拿space里面的data
				 */
				occupied.await();
			}
			// 此时有空位，需要让vacancy通知其他线程，已经有空余位置了
			vacancy.signalAll();
			System.out.printf("Get: %d: %s\n", space.size(), ((LinkedList<?>) space).getLast());
			return space.pollLast();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} finally {
			lock.unlock();
		}
		return null;
	}

	public void add(T data) {
		lock.lock();
		try {
			// 由于space已经满，vacancy需要等待
			while (space.size() == this.size) {
				// 此时此线程被挂起，其他线程拿到锁
				/**
				 * 其他某一个线程拿到锁后，此时可以调用get方法从space里面拿data，拿完之后add方法里会调用vacancy.
				 * signalAll();
				 * 
				 * 这时因为vacancy.await()而被挂起的本线程又被重新唤醒了，知道space里面有空位了，就跳出while循环，
				 * 接着往下进行去放data进入space
				 */
				vacancy.await();
			}
			// 此时不为空，需要让occupied通知其他线程，已经有东西可以拿了
			occupied.signalAll();
			System.out.printf(Thread.currentThread().getName() + " add: %d\n", space.size());
			space.addLast(data);
		} catch (InterruptedException e) {
			e.printStackTrace();
		} finally {
			lock.unlock();
		}
	}

	public static void main(String[] args) {

		// Creates an event storage
		Storage2<String> storage = new Storage2(10);
		// Creates a Producer and a Thread to run it
		Producer2<String> producer = new Producer2(storage);
		Thread thread1 = new Thread(producer);

		// Creates a Consumer and a Thread to run it
		Consumer2<String> consumer = new Consumer2(storage);
		Thread thread2 = new Thread(consumer);

		// Starts the thread
		thread2.start();
		thread1.start();
	}

}

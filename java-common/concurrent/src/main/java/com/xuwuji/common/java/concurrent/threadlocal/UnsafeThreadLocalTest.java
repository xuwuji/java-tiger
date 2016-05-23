package com.xuwuji.common.java.concurrent.threadlocal;

import java.util.Random;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * do not use threadlocals
 * 
 * @author wuxu
 *
 */
public class UnsafeThreadLocalTest implements Runnable {
	private Student student;

	/**
	 * 在这里由于没有使用threadlocal，student变量是被所有线程共享的，那么多线程的环境下，
	 * 每个线程都对此变量进行了一次setAge和setName操作
	 * 
	 * 但是在System.out.println(student)时，由于此时student是共享的，
	 * 那么student的值取决于最后一个对它进行赋值的线程进行的操作
	 * 
	 */
	public void run() {
		String currentThreadName = Thread.currentThread().getName();
		System.out.println(currentThreadName + " is running!");

		student = new Student();
		Random random = new Random();
		int age = random.nextInt(100);
		student.setAge(age);
		student.setName(Thread.currentThread().getName() + " add student ");

		System.out.println(student);
	}

	public static void main(String[] args) {
		// 这里UnsafeThreadLocalTest test = new UnsafeThreadLocalTest()
		// 生成了一个instance叫test
		UnsafeThreadLocalTest test = new UnsafeThreadLocalTest();
		/**
		 * 新建三个thread，都对test这个instance进行操作，那么这个instance内的student就是共享的，
		 * 也就是说所有thread操作的都是同一个student
		 */
		Thread t1 = new Thread(test);
		Thread t2 = new Thread(test);
		Thread t3 = new Thread(test);
		t1.start();
		t2.start();
		t3.start();

		/**
		 * 若按照此写法，相当于新建了五个thread，
		 * 但每个thread都是对一个新的UnsafeThreadLocalTest的instance进行操作
		 * 
		 * 所以此时由于每个thread操作的instance不同，自然每个thread操作的student都不一样
		 */
		ExecutorService service = Executors.newCachedThreadPool();
		for (int i = 0; i < 5; i++) {
			service.execute(new UnsafeThreadLocalTest());
		}

	}

}

package com.xuwuji.common.java.concurrent.threadlocal;

import java.util.Random;

public class ThreadLocalTest implements Runnable {

	private ThreadLocal<Student> studentLocal = new ThreadLocal<Student>();

	/**
	 * 使用threadlocal时，studentLocal是每个线程所自己享有的变量，不是共享的
	 * 
	 * 进行System.out.println(student)时，student的值是每个变量对自己本身的student进行赋值操作后所得的结果
	 * 
	 */
	public void run() {
		String currentThreadName = Thread.currentThread().getName();
		System.out.println(currentThreadName + " is running!");

		Student student = this.studentLocal.get();
		if (student == null) {
			student = new Student();
			studentLocal.set(student);
		}

		Random random = new Random();
		int age = random.nextInt(100);

		student.setAge(age);
		student.setName(Thread.currentThread().getName() + " add student ");

		System.out.println(student);
	}

	public static void main(String[] args) {
		ThreadLocalTest test = new ThreadLocalTest();
		/**
		 * 新建三个thread，都对test这个instance进行操作，但是由于此时instance内的student是threadlocal，
		 * 说明student这个instance variable对于不同的thread有不同的副本
		 * 
		 * 此时虽然所有的thread操作于同一个instance，但是操作的不是同一个student
		 */
		Thread t1 = new Thread(test);
		Thread t2 = new Thread(test);
		Thread t3 = new Thread(test);
		t1.start();
		t2.start();
		t3.start();

	}

}

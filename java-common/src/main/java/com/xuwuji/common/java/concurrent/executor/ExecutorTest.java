package com.xuwuji.common.java.concurrent.executor;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * With an executor, you only have to implement the Runnable objects and send
 * them to the executor. It is responsible for their execution, instantiation,
 * and running with necessary threads. But it goes beyond that and improves
 * performance using a pool of threads. When you send a task to the executor, it
 * tries to use a pooled thread for the execution of this task, to avoid
 * continuous spawning of threads.
 * 
 * @author wuxu
 * 
 *         2016-5-9
 *
 */
public class ExecutorTest {

	/**
	 * When you use basic ThreadPoolExecutor created with the
	 * newCachedThreadPool() method of the Executors class, you can have a
	 * problem with the number of threads the executor is running at a time. The
	 * executor creates a new thread for each task that receives, (if there is
	 * no pooled thread free) so, if you send a large number of tasks and they
	 * have long duration, you can overload the system and provoke a poor
	 * performance of your application.
	 */
	public static void cachedPoolTest() {
		ThreadPoolExecutor service = (ThreadPoolExecutor) Executors.newCachedThreadPool();
		for (int i = 0; i < 10; i++) {
			System.out.printf("Server: A new task has arrived\n");
			service.execute(new Task());
			System.out.printf("Server: Pool Size: %d\n", service.getPoolSize());
			System.out.printf("Server: Active Count: %d\n", service.getActiveCount());
			System.out.printf("Server: Completed Tasks: %d\n", service.getCompletedTaskCount());
		}
		service.shutdown();
	}

	/**
	 * If you want to avoid this problem, the Executors class provides a method
	 * to create a xed-size thread executor. This executor has a maximum number
	 * of threads. If you send more tasks than the number of threads, the
	 * executor won't create additional threads and the remaining tasks will be
	 * blocked until the executor has a free thread. With this behavior, you
	 * guarantee that the executor won't yield a poor performance of your
	 * application.
	 */
	public static void fixededPoolTest() {
		ThreadPoolExecutor service = (ThreadPoolExecutor) Executors.newFixedThreadPool(5);
		for (int i = 0; i < 10; i++) {
			System.out.printf("Server: A new task has arrived\n");
			service.execute(new Task());
			System.out.printf("Server: Pool Size: %d\n", service.getPoolSize());
			System.out.printf("Server: Active Count: %d\n", service.getActiveCount());
			System.out.printf("Server: Completed Tasks: %d\n", service.getCompletedTaskCount());
		}
		service.shutdown();
	}

	/**
	 * Executing tasks in an executor that returns a result
	 */
	public static void invokeAnyTest() {
		ThreadPoolExecutor service = (ThreadPoolExecutor) Executors.newCachedThreadPool();
		List<CallableTask> tasks = new ArrayList();
		for (int i = 0; i < 10; i++) {
			tasks.add(new CallableTask());
		}
		try {
			String result = service.invokeAny(tasks);
			System.out.println(result + " is the first to be finished");
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ExecutionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		service.shutdown();
	}

	/**
	 * Running multiple tasks and processing the rst result
	 */
	public static void invokeAllTest() {
		ThreadPoolExecutor service = (ThreadPoolExecutor) Executors.newCachedThreadPool();
		List<CallableTask> tasks = new ArrayList();
		for (int i = 0; i < 10; i++) {
			tasks.add(new CallableTask());
		}
		try {
			List<Future<String>> results = new ArrayList<Future<String>>();
			results = service.invokeAll(tasks);
			System.out.println(" all tasks have been finished");
			for (Future<String> f : results) {
				System.out.println(f.get());
			}
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ExecutionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		service.shutdown();
	}

	/**
	 * Running a task in an executor after a delay
	 */
	public static void schedualPoolExecutorTest() {
		// Create a ScheduledThreadPoolExecutor
		ScheduledExecutorService executor = (ScheduledExecutorService) Executors.newScheduledThreadPool(3);

		System.out.printf("Main: Starting at: %s\n", new Date());

		// Send the tasks to the executor with the specified delay
		for (int i = 0; i < 5; i++) {
			Task task = new Task("Task " + i);
			// 第二个参数是使此线程距离最初时间的间隔时间，不是与前一个线程运行的时间间隔
			executor.schedule(task, i + 2, TimeUnit.SECONDS);
		}
		// 其实也相当于
		// executor.schedule(new Task(), 2, TimeUnit.SECONDS);
		// executor.schedule(new Task(), 2 + 2, TimeUnit.SECONDS);
		// executor.schedule(new Task(), 2 + 2 + 2, TimeUnit.SECONDS);
		// executor.schedule(new Task(), 2 + 2 + 2 + 2, TimeUnit.SECONDS);

		// Finish the executor
		executor.shutdown();

		// Waits for the finalization of the executor
		try {
			executor.awaitTermination(1, TimeUnit.DAYS);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		// Writes the finalization message
		System.out.printf("Core: Ends at: %s\n", new Date());
	}

	public void schedualPeriodicallyTest() {

	}

	public static void cancelCallableTask() {
		// Create an executor
		ThreadPoolExecutor executor = (ThreadPoolExecutor) Executors.newCachedThreadPool();

		// Create a task
		InfiniteCallableTask task = new InfiniteCallableTask();

		System.out.printf("Main: Executing the Task\n");

		// Send the task to the executor
		Future<String> result = executor.submit(task);
		Future<String> result2 = executor.submit(task);

		// Sleep during two seconds
		try {
			TimeUnit.SECONDS.sleep(2);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		// Cancel the task, finishing its execution
		System.out.printf("Main: Cancelling the Task\n");
		result.cancel(true);
		// Verify that the task has been cancelled
		System.out.printf("Main: Cancelled: %s\n", result.isCancelled());
		System.out.printf("Main: Done: %s\n", result.isDone());

		System.out.printf("Main: Cancelling the Task\n");
		result2.cancel(true);
		// Verify that the task has been cancelled
		System.out.printf("Main: Cancelled: %s\n", result2.isCancelled());
		System.out.printf("Main: Done: %s\n", result2.isDone());

		// Shutdown the executor
		executor.shutdown();
		System.out.printf("Main: The executor has finished\n");
	}

	public static void main(String[] args) {
		// ExecutorTest.cachedPoolTest();
		// ExecutorTest.fixededPoolTest();
		// ExecutorTest.invokeAnyTest();
		// ExecutorTest.invokeAllTest();
		// ExecutorTest.schedualPoolExecutorTest();
		ExecutorTest.cancelCallableTask();
	}
}

class Task implements Runnable {
	/**
	 * Name of the task
	 */
	private String name;

	/**
	 * Constructor of the class
	 * 
	 * @param name
	 *            Name of the task
	 */
	public Task(String name) {
		this.name = name;
	}

	public Task() {

	}

	public void run() {
		System.out.println(Thread.currentThread().getName() + " is running");
		try {
			System.out.printf("%s: Starting at : %s\n", Thread.currentThread().getName(), new Date());
			Long duration = (long) (Math.random() * 10);
			Thread.sleep(duration);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		System.out.println(Thread.currentThread().getName() + " has end");
	}

}

class CallableTask implements Callable<String> {

	public String call() throws Exception {
		System.out.println(Thread.currentThread().getName() + " is running");
		try {
			Long duration = (long) (Math.random() * 10);
			Thread.sleep(duration);
		} catch (InterruptedException e) {
			// 在这里，不是第一个结束的线程会由于还没有占用cpu，此时调用interrupt会报出异常，所以要return null；
			return null;
		}
		System.out.println(Thread.currentThread().getName() + " has end");
		return Thread.currentThread().getName();
	}
}

class InfiniteCallableTask implements Callable<String> {

	public String call() throws Exception {
		while (true) {
			System.out.println("running");
			Thread.sleep(100);
		}
		// return null;
	}
}

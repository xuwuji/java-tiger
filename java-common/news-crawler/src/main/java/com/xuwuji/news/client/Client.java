package com.xuwuji.news.client;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.LinkedList;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;

import com.xuwuji.news.task.Storage;
import com.xuwuji.news.task.Task;

public class Client {

	public static void main(String[] args) throws IOException {
		Client client = new Client();
		LinkedList<String> list = new LinkedList<String>();
		list = client.load(list);
		Storage storage = new Storage(list);
		ThreadPoolExecutor service = (ThreadPoolExecutor) Executors.newFixedThreadPool(20);
		for (int i = 0; i < 30; i++) {
			service.execute(new Task(storage));
		}
		service.shutdown();
		// System.out.println(storage.getMap().size());
	}

	private LinkedList<String> load(LinkedList<String> list) {
		try {
			BufferedReader bufferedReader = new BufferedReader(
					new InputStreamReader(Client.class.getClassLoader().getResourceAsStream("links2.txt")));
			String lineTxt = null;
			while ((lineTxt = bufferedReader.readLine()) != null) {
				// System.out.println(lineTxt);
				list.add(lineTxt);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}

}

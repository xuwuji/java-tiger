import java.io.IOException;
import java.util.LinkedList;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;

import com.xuwuji.news.task.Storage;
import com.xuwuji.news.task.Task;

public class Client {

	public static void main(String[] args) throws IOException {
		ThreadPoolExecutor service = (ThreadPoolExecutor) Executors.newCachedThreadPool();
		LinkedList<String> list = new LinkedList<String>();
		list.add("http://news.qq.com/");
		list.add("http://mil.qq.com/");
		list.add("http://ent.qq.com/");
		list.add("http://ent.qq.com/movie/");
		list.add("http://auto.qq.com/");
		list.add("http://tech.qq.com/");
		list.add("http://edu.qq.com/");
		// list.add("http://class.qq.com/");
		list.add("http://abroad.qq.com/");
		list.add("http://finance.qq.com/");
		list.add("http://finance.qq.com/money/");
		list.add("http://stock.qq.com/");
		list.add("http://sports.qq.com/");
		list.add("http://sports.qq.com/nba/");
		list.add("http://astro.fashion.qq.com/");
		list.add("http://house.qq.com/");
		Storage storage = new Storage(list);
		for (int i = 0; i < 20; i++) {
			service.execute(new Task(storage));
		}
		service.shutdown();
		System.out.println(storage.getMap().size());
	}

}

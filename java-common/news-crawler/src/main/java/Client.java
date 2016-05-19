import java.io.IOException;
import java.util.LinkedList;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;

public class Client {

	public static void main(String[] args) throws IOException {
		ThreadPoolExecutor service = (ThreadPoolExecutor) Executors.newCachedThreadPool();
		LinkedList<String> list = new LinkedList<String>();
		list.add("http://www.qq.com/");
		list.add("http://sports.qq.com/");
		list.add("http://news.qq.com/");
		Storage storage = new Storage(list);

		for (int i = 0; i < 3; i++) {
			service.execute(new Task(storage));
		}
		service.shutdown();
		System.out.println(storage.getMap().size());
	}

}

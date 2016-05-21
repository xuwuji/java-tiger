import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.LinkedList;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;

import com.xuwuji.news.task.Storage;
import com.xuwuji.news.task.Task;
import com.xuwuji.news.util.SessionFactory;

public class Client {

	public static void main(String[] args) throws IOException {
		Client client = new Client();
		LinkedList<String> list = new LinkedList<String>();
		list = client.load(list);
		Storage storage = new Storage(list);

		ThreadPoolExecutor service = (ThreadPoolExecutor) Executors.newCachedThreadPool();
		for (int i = 0; i < 20; i++) {
			service.execute(new Task(storage));
		}
		service.shutdown();
		System.out.println(storage.getMap().size());
	}

	private LinkedList<String> load(LinkedList<String> list) {
		try {
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream("links.txt")));
			String lineTxt = null;
			while ((lineTxt = bufferedReader.readLine()) != null) {
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

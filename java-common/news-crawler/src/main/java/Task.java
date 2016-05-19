import java.io.IOException;
import java.util.HashMap;
import java.util.Map.Entry;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Task implements Runnable {

	private Storage storage;
	private ThreadLocal<Integer> tag = new ThreadLocal<Integer>();

	public Task(Storage storage) {
		this.storage = storage;
	}

	public void run() {
		tag.set(0);
		long start = System.currentTimeMillis();
		String link = storage.getLink();
		try {
			processLink(link);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		long end = System.currentTimeMillis();
		System.out.println(link + " has finished, it costs " + (end - start) / 1000);
	}

	public void processLink(String linkStr) throws IOException {
		Document doc;
		Elements hrefs = null;
		try {
			doc = Jsoup.connect(linkStr).get();
			hrefs = doc.select("a[href]");
			for (Element e : hrefs) {

			}
			process(0, hrefs);

		} catch (java.net.SocketTimeoutException e) {
			System.out.println(linkStr + " time out!!!!!!!!");
			process(tag.get(), hrefs);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

	}

	public void process(int index, Elements hrefs) throws IOException {
		for (int i = index; i < hrefs.size(); i++) {
			String title = ((Element) hrefs.get(i)).text();
			String link = ((Element) hrefs.get(i)).attr("href").trim();
			// System.out.println(link);
			if (title.length() >= 8 && link.indexOf("http") != -1) {
				tag.set(tag.get() + 1);
				String category = getCategory(link);
				if (category != null) {
					storage.put(title, link);
					System.out.println(title);
					System.out.println(link);
					System.out.println(category);
					System.out.println("-------\n");
				}
			}

		}
	}

	public String getCategory(String link) throws IOException {
		// System.out.println(link);
		Document doc = Jsoup.connect(link).get();
		Elements attrs = doc.select("[bosszone=\"ztTopic\"]");
		String category = null;
		for (Element e : attrs) {
			category = e.text();
			if (category != null || !category.equals("")) {
				break;
			}
		}
		return category;
	}
}

package com.xuwuji.eshop.img;

import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

public class Tesq {
	public static void main(String[] args) {
		String url = "http://i1.bvimg.com/677237/a7a31b8795c57402.jpg";
		String path = "./src/main/webapp/resources/img/pic.jpg";
		downloadPicture(url, path);
	}

	// Á´½ÓurlÏÂÔØÍ¼Æ¬
	private static void downloadPicture(String urlList, String path) {
		URL url = null;
		try {
			url = new URL(urlList);
			DataInputStream dataInputStream = new DataInputStream(url.openStream());

			FileOutputStream fileOutputStream = new FileOutputStream(new File(path));
			ByteArrayOutputStream output = new ByteArrayOutputStream();

			byte[] buffer = new byte[1024];
			int length;

			while ((length = dataInputStream.read(buffer)) > 0) {
				output.write(buffer, 0, length);
			}
			fileOutputStream.write(output.toByteArray());
			dataInputStream.close();
			fileOutputStream.close();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

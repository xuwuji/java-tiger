package com.xuwuji.eshop.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.commons.httpclient.methods.StringRequestEntity;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class HttpUtil {

	public static String getMethod(String url, String attribute) {
		GetMethod request = null;
		request = new GetMethod(url);
		HttpClient client = new HttpClient();
		client.getParams().setSoTimeout(3 * 60 * 1000); // timeout 3 minutes
		String result = "";
		int status = -1;
		try {
			status = client.executeMethod(request);
			if (status != 200) {
				throw new RuntimeException("Got unexpected response code " + status);
			}
			result = request.getResponseBodyAsString();
			ObjectMapper mapper = new ObjectMapper();
			JsonNode rootNode = mapper.readTree(result);
			result = rootNode.get(attribute).asText();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			request.releaseConnection();
		}
		return result;
	}

	public static boolean checkValid(String url) {
		int counts = 0;
		if (url == null || url.length() <= 0) {
			return false;
		}
		while (counts < 5) {
			try {
				URL Url = new URL(url);
				HttpURLConnection con = (HttpURLConnection) Url.openConnection();
				int state = con.getResponseCode();
				if (state == 404) {
					return false;
				}
				break;
			} catch (Exception ex) {
				continue;
			}
		}
		return true;
	}

	// post
	public static String postMethod(String requestUrl, String payload) {
		// 创建SSLContext
		StringBuffer buffer = null;
		try {
			URL url = new URL(requestUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.connect();
			// 往服务器端写内容
			if (null != payload) {
				OutputStream os = conn.getOutputStream();
				os.write(payload.getBytes("utf-8"));
				os.close();
			}
			// 读取服务器端返回的内容
			InputStream is = conn.getInputStream();
			InputStreamReader isr = new InputStreamReader(is, "utf-8");
			BufferedReader br = new BufferedReader(isr);
			buffer = new StringBuffer();
			String line = null;
			while ((line = br.readLine()) != null) {
				buffer.append(line);
			}
			br.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return buffer.toString();
	}

}

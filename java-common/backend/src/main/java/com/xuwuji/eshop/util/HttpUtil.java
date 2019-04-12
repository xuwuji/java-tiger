package com.xuwuji.eshop.util;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.GetMethod;

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
}

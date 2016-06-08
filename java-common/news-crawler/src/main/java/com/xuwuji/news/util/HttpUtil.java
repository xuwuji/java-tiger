package com.xuwuji.news.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.GetMethod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HttpUtil {

	private static final Logger LOG = LoggerFactory.getLogger(HttpUtil.class);

	public static String getHttpResponse(String url) throws Exception {
		GetMethod request = null;
		request = new GetMethod(url);
		HttpClient client = new HttpClient();
		client.getParams().setSoTimeout(3 * 60 * 1000); // timeout 3 minutes
		String response = "";
		int status = -1;
		try {
			LOG.info(request.getURI().toString());
			status = client.executeMethod(request);
			if (status != 200) {
				throw new RuntimeException("Got unexpected response code " + status);
			}
			response = request.getResponseBodyAsString();
		} catch (HttpException e) {
			LOG.error("Fatal protocol violation: " + e.getMessage());
			throw e;
		} catch (IOException e) {
			LOG.error("Fatal transport error: " + e.getMessage());
			throw e;
		} finally {
			// Release the connection.
			request.releaseConnection();
		}
		return response;
	}

	public static Map<String, List<String>> splitUrlQueryString(String urlQueryString)
			throws UnsupportedEncodingException {
		final Map<String, List<String>> query_pairs = new LinkedHashMap<String, List<String>>();
		final String[] pairs = urlQueryString.split("&");
		for (String pair : pairs) {
			final int idx = pair.indexOf("=");
			final String key = idx > 0 ? URLDecoder.decode(pair.substring(0, idx), "UTF-8") : pair;
			if (!query_pairs.containsKey(key)) {
				query_pairs.put(key, new LinkedList<String>());
			}
			final String value = idx > 0 && pair.length() > idx + 1
					? URLDecoder.decode(pair.substring(idx + 1), "UTF-8") : null;
			query_pairs.get(key).add(value);
		}
		return query_pairs;
	}
}

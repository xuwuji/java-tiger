package com.xuwuji.eshop.util;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

@Component
public class QRCodeUtil {
	public static final String ACCESS_TOKEN = "access_token";

	public static String getAccessToken() {
		String url = "https://api.weixin.qq.com/cgi-bin/token?appid=" + TokenUtil.APPID + "&secret="
				+ TokenUtil.APPSECRET + "&grant_type=client_credential";
		return HttpUtil.getMethod(url, ACCESS_TOKEN);
	}

	public static byte[] getQRCoderByte(String productId) {
		RestTemplate rest = new RestTemplate();
		String url = "https://api.weixin.qq.com/wxa/getwxacodeunlimit?access_token=" + getAccessToken();
		Map<String, Object> param = new HashMap<>();
		param.put("scene", productId);
		param.put("page", "pages/product/product");
		param.put("width", 430);
		param.put("auto_color", false);
		Map<String, Object> line_color = new HashMap<>();
		line_color.put("r", 0);
		line_color.put("g", 0);
		line_color.put("b", 0);
		param.put("line_color", line_color);
		MultiValueMap<String, String> headers = new LinkedMultiValueMap<>();
		HttpEntity requestEntity = new HttpEntity(param, headers);
		ResponseEntity<byte[]> entity = rest.exchange(url, HttpMethod.POST, requestEntity, byte[].class, new Object[0]);
		byte[] result = entity.getBody();
		return result;
	}

	public static byte[] getBarginQRCoderByte(String barginOrderId) {
		RestTemplate rest = new RestTemplate();
		String url = "https://api.weixin.qq.com/wxa/getwxacodeunlimit?access_token=" + getAccessToken();
		Map<String, Object> param = new HashMap<>();
		param.put("scene", barginOrderId);
		param.put("page", "pages/barginShare/barginShare");
		param.put("width", 430);
		param.put("auto_color", false);
		Map<String, Object> line_color = new HashMap<>();
		line_color.put("r", 0);
		line_color.put("g", 0);
		line_color.put("b", 0);
		param.put("line_color", line_color);
		MultiValueMap<String, String> headers = new LinkedMultiValueMap<>();
		HttpEntity requestEntity = new HttpEntity(param, headers);
		ResponseEntity<byte[]> entity = rest.exchange(url, HttpMethod.POST, requestEntity, byte[].class, new Object[0]);
		byte[] result = entity.getBody();
		return result;
	}

	public static byte[] getQRCoderByte(String scene, String page) {
		RestTemplate rest = new RestTemplate();
		String url = "https://api.weixin.qq.com/wxa/getwxacodeunlimit?access_token=" + getAccessToken();
		Map<String, Object> param = new HashMap<>();
		param.put("scene", scene);
		param.put("page", String.format("pages/%1$s/%2$s", page));
		param.put("width", 430);
		param.put("auto_color", false);
		Map<String, Object> line_color = new HashMap<>();
		line_color.put("r", 0);
		line_color.put("g", 0);
		line_color.put("b", 0);
		param.put("line_color", line_color);
		MultiValueMap<String, String> headers = new LinkedMultiValueMap<>();
		HttpEntity requestEntity = new HttpEntity(param, headers);
		ResponseEntity<byte[]> entity = rest.exchange(url, HttpMethod.POST, requestEntity, byte[].class, new Object[0]);
		byte[] result = entity.getBody();
		return result;
	}

	public static String getQRCoder() {
		RestTemplate rest = new RestTemplate();
		InputStream inputStream = null;
		OutputStream outputStream = null;
		System.out.print(getAccessToken());
		String encoded = "";
		try {
			String url = "https://api.weixin.qq.com/wxa/getwxacodeunlimit?access_token=" + getAccessToken();
			Map<String, Object> param = new HashMap<>();
			param.put("scene", "aaa");
			param.put("page", "pages/home/home");
			param.put("width", 430);
			param.put("auto_color", false);
			Map<String, Object> line_color = new HashMap<>();
			line_color.put("r", 0);
			line_color.put("g", 0);
			line_color.put("b", 0);
			param.put("line_color", line_color);
			MultiValueMap<String, String> headers = new LinkedMultiValueMap<>();
			HttpEntity requestEntity = new HttpEntity(param, headers);
			ResponseEntity<byte[]> entity = rest.exchange(url, HttpMethod.POST, requestEntity, byte[].class,
					new Object[0]);
			byte[] result = entity.getBody();
			encoded = Base64.getEncoder().encodeToString(result);

			inputStream = new ByteArrayInputStream(result);
			File file = new File("3.png");
			if (!file.exists()) {
				file.createNewFile();
			}
			outputStream = new FileOutputStream(file);
			int len = 0;
			byte[] buf = new byte[1024];
			while ((len = inputStream.read(buf, 0, 1024)) != -1) {
				outputStream.write(buf, 0, len);
			}
			outputStream.flush();
			return encoded;
		} catch (Exception e) {
		} finally {
			if (inputStream != null) {
				try {
					inputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (outputStream != null) {
				try {
					outputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return encoded;
	}

	public static void main(String[] args) {
		// System.out.println(getToken());
		getQRCoder();
	}

}

package com.xuwuji.eshop.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.dao.ConfigDao;
import com.xuwuji.eshop.model.Config;

@Component
public class EshopConfigUtil {
	@Autowired
	private ConfigDao configDao;

	public static final String PRODUCT_IMG_BASE = "productImgBase";
	public static final String CATEGORY_IMG_BASE = "categoryImgBase";
	public static final String BANNER_IMG_BASE = "bannerImgBase";
	public static final String xxcUrl = "xxcUrl";
	public static final String noticeMsg = "noticeMsg";
	public static Map<String, Object> configMap = new HashMap<String, Object>();

	public String getParam(String paramName) {
		String value = "";
		value = (String) configMap.get(paramName);
		if ((!configMap.containsKey(paramName)) || value == null || value.isEmpty()) {
			List<Config> list = configDao.getAll();
			for (Config c : list) {
				if (c.getName().equals(paramName)) {
					value = c.getValue();
					configMap.put(paramName, value);
					return value;
				}
			}
		}
		return value;
	}

	public void addParam(String paramName, String value) {
		Config config = new Config();
		config.setName(paramName);
		config.setValue(value);
		configDao.add(config);
		configMap.put(paramName, value);
	}

	public void updateParam(String paramName, String value, String id) {
		Config config = new Config();
		config.setName(paramName);
		config.setValue(value);
		config.setId(Integer.valueOf(id));
		configDao.update(config);
		configMap.put(paramName, value);
	}

	public List<Config> getAll() {
		return configDao.getAll();
	}
}

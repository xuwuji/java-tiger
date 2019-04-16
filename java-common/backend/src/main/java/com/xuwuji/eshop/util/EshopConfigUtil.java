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
	public static final String ARTICLE_IMG_BASE = "articleImgBase";
	public static final String POPULAR_PRODUCTS = "popularProducts";
	public static final String COUNTRY_FLAG_BASE = "countryFlagImgBase";
	public static final String BRAND_IMG_BASE = "brandImgBase";
	public static final String xxcUrl = "xxcUrl";
	public static final String PRE_SEARCH = "preSearch";
	public static final String ARTICLE_PRE_SEARCH = "articlePreSearch";
	public static final String noticeMsg = "noticeMsg";
	public static final String SHOW_NOTICE_MESSAGE = "showNoticeMessage";
	public static final String BONUS = "bonus";
	public static final String SHARE_TITLE = "shareTitle";
	public static final String GOLD_DISCOUNT = "goldDiscount";
	public static final String PLATINUM_DISCOUNT = "platinumDiscount";
	public static final String DiAMOND_DISCOUNT = "diamondDiscount";
	public static final String LICENCE_IMG_URL = "licenceImgUrl";
	public static final String SHARE_IMG_URL = "shareImgUrl";
	public static final String PRODUCT_DETAIL_IMG_BASE="productDetailImgBase";
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

	public void addParam(Config config) {
		configDao.add(config);
		configMap.put(config.getName(), config.getValue());
	}

	public void updateParam(Config config) {
		configDao.update(config);
		configMap.put(config.getName(), config.getValue());
	}

	public List<Config> getAll() {
		return configDao.getAll();
	}
}

package com.xuwuji.eshop.db.mapper;

import java.util.HashMap;
import java.util.List;

import com.xuwuji.eshop.model.BannerItem;
import com.xuwuji.eshop.model.Config;

public interface ConfigMapper {

	public void addParam(HashMap<String, Object> map);

	public void update(HashMap<String, Object> map);

	public List<Config> getAll();
}

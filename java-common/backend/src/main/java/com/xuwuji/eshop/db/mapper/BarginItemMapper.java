package com.xuwuji.eshop.db.mapper;

import java.util.HashMap;
import java.util.List;

import com.xuwuji.eshop.model.BarginItem;

public interface BarginItemMapper {

	public void add(BarginItem barginItem);

	public void disable(HashMap<String, Object> map);

	public void reActive(HashMap<String, Object> map);

	public void update(HashMap<String, Object> map);

	public List<BarginItem> getAll();

	public List<BarginItem> isJoinedBargin(HashMap<String, Object> map);

	public List<HashMap<String, Object>> getActiveCategories();

	public List<BarginItem> getActiveByCategoryId(HashMap<String, Object> map);

	public List<BarginItem> getById(HashMap<String, Object> map);

	public List<BarginItem> getByCategoryId(HashMap<String, Object> map);

}

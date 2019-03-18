package com.xuwuji.eshop.db.mapper;

import java.util.HashMap;
import java.util.List;

import com.xuwuji.eshop.model.Brand;
import com.xuwuji.eshop.model.Promotion;

public interface PromotionMapper {

	public void add(HashMap<String, Object> map);
	
	public void update(HashMap<String, Object> map);

	public void disable(HashMap<String, Object> map);

	public void reActive(HashMap<String, Object> map);

	public List<Promotion> getAll();

	public List<Promotion> getActiveAll();
	
	public List<Promotion> getActiveAllByBrandId(HashMap<String, Object> map);

	public List<Promotion> getActiveAllByCategoryId(HashMap<String, Object> map);

}

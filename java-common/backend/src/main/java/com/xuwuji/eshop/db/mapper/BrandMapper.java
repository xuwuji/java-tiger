package com.xuwuji.eshop.db.mapper;

import java.util.HashMap;
import java.util.List;

import com.xuwuji.eshop.model.Brand;

public interface BrandMapper {

	public void add(HashMap<String, Object> map);
	
	public void update(HashMap<String, Object> map);

	public void disable(HashMap<String, Object> map);

	public void reActive(HashMap<String, Object> map);
	
	public List<Brand> getById(HashMap<String, Object> map);

	public List<Brand> getAll();

	public List<Brand> getActiveAll();
	
	public List<Brand> getActiveAllByBrandId(HashMap<String, Object> map);
}

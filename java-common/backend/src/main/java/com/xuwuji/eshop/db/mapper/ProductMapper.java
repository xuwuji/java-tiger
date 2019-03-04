package com.xuwuji.eshop.db.mapper;

import java.util.HashMap;
import java.util.List;

import com.xuwuji.eshop.model.Product;

public interface ProductMapper {

	public void add(HashMap<String, Object> map);

	public void disable(HashMap<String, Object> map);

	public void reActive(HashMap<String, Object> map);

	public void update(HashMap<String, Object> map);

	public List<Product> getByCategory(HashMap<String, Object> map);
	
	public List<Product> getActiveByCategory(HashMap<String, Object> map);
	
	public Product getById(HashMap<String, Object> map);

}

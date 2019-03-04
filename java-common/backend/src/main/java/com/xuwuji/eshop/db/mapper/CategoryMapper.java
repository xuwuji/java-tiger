package com.xuwuji.eshop.db.mapper;

import java.util.HashMap;
import java.util.List;

import com.xuwuji.eshop.model.Category;

public interface CategoryMapper {

	public void add(HashMap<String, Object> map);

	public void disable(HashMap<String, Object> map);

	public void reActive(HashMap<String, Object> map);

	public void update(HashMap<String, Object> map);

	public List<Category> getByParent(HashMap<String, Object> map);
	
	public List<Category> getActiveByParent(HashMap<String, Object> map);

}

package com.xuwuji.eshop.db.mapper;

import java.util.HashMap;
import java.util.List;

import com.xuwuji.eshop.model.Product;

public interface ProductMapper {

	public int add(Product product);

	public void disable(HashMap<String, Object> map);

	public void reActive(HashMap<String, Object> map);

	public void update(HashMap<String, Object> map);

	public List<Product> getByCategory(HashMap<String, Object> map);
	
	public List<Product> getDetailByCategory(HashMap<String, Object> map);

	public List<Product> getActiveByCategory(HashMap<String, Object> map);

	public Product getById(HashMap<String, Object> map);

	public void updateBannerItem(HashMap<String, Object> map);
	
	public void updateBrand(HashMap<String, Object> map);
	
	public List<Product> getActiveByKW(HashMap<String, Object> map);
	
	public List<Product> getActiveByBannerItem(HashMap<String, Object> map);
	
	public void updateImgUrl(HashMap<String, Object> map);
	
	public List<Product> getActiveByBrandId(HashMap<String, Object> map);

	public List<Product> getActivityByTop();

	

}

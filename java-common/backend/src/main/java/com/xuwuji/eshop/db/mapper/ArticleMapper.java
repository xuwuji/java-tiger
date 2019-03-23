package com.xuwuji.eshop.db.mapper;

import java.util.HashMap;
import java.util.List;

import com.xuwuji.eshop.model.Article;

public interface ArticleMapper {

	public void add(HashMap<String, Object> map);
	
	public void update(HashMap<String, Object> map);

	public void disable(HashMap<String, Object> map);

	public void reActive(HashMap<String, Object> map);
	
	public List<Article> getById(HashMap<String, Object> map);

	public List<Article> getAll();

	public List<Article> getActiveAll();
	
	public List<Article> getActiveAllByTags(HashMap<String, Object> map);
	
}

package com.xuwuji.db.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.xuwuji.db.model.News;

public interface NewsMapper {

	void insertNews(News news);

	List<News> findByKeyword(String keyword);

	List<News> findNewsByTypeId(Map<String, Object> map);

	List<HashMap<String, Object>> findNewsByTypeId2(Map<String, Object> map);

	List<News> findHotNews(String time);

	List<News> findByTitle(String title);

	News findById(int id);
}

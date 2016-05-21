package com.xuwuji.news.mapper;

import java.util.List;
import java.util.Map;

import com.xuwuji.news.model.News;

public interface NewsMapper {

	void insertNews(News news);

	List<News> findByKeyword(String keyword);

	List<String> getTypes();

	List<News> findNewsByCategory(Map<String, Object> map);

}

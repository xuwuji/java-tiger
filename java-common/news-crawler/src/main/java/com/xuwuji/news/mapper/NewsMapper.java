package com.xuwuji.news.mapper;

import java.util.List;

import com.xuwuji.news.model.News;

public interface NewsMapper {

	void insertNews(News news);

	List<News> findByCategory(String category);

	List<News> findByKeyword(String keyword);
}

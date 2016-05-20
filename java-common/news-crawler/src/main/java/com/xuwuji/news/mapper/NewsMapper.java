package com.xuwuji.news.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xuwuji.news.model.News;

public interface NewsMapper {

	void insertNews(News news);

	List<News> findByCategory(String category);

	List<News> findByKeyword(String keyword);

	List<String> getTypes();

	List<News> findNewsByCategory(@Param("type") String type, @Param("bigCategory") String bigCategory,
			@Param("subCategory") String subCategory);

}

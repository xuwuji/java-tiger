package com.xuwuji.db.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.xuwuji.db.model.News;

public interface NewsMapper {

	int insertNews(News news);

	List<News> findByKeyword(String keyword);

	List<News> findNewsByTypeId(Map<String, Object> map);

	List<HashMap<String, Object>> findNewsByTypeId2(Map<String, Object> map);

	List<News> findHotNews(@Param("time") String time, @Param("type") String type);

	List<News> findByTitle(String title);

	News findById(int id);

	News findInfoById(int id);

	void insertNewsContent(@Param("id") int id, @Param("content") String content);

	String findContentById(@Param("id") int id);
}

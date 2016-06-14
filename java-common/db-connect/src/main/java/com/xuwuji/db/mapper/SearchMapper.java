package com.xuwuji.db.mapper;

import java.util.List;

import com.xuwuji.db.model.News;

public interface SearchMapper {

	List<News> findByKeyword(String keyword);

}

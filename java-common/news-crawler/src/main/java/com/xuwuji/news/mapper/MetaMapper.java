package com.xuwuji.news.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.xuwuji.news.model.Category;

public interface MetaMapper {

	// 1.第一种是在xml中定义为传入map，之后把参数put进map中
	List<Integer> findId(Map<String, Object> map);

	// 2. 第二中也是在xml中定义为传入map，但是通过@param注解，直接在方法处传入参数
	List<Integer> findId2(@Param("type") String type, @Param("bigCategory") String bigCategory,
			@Param("subCategory") String subCategory);

	void insert(Map<String, Object> map);

	List<String> getTypes();

	List<String> getBigCategoryByType(String type);

	List<String> getsubCategoryByBig(String bigCategory);

	// get all news meta
	List<Category> selectAll();

}

package com.xuwuji.eshop.db.mapper;

import java.util.HashMap;
import java.util.List;

import com.xuwuji.eshop.model.SearchHistory;

public interface SearchHistoryMapper {

	public void add(SearchHistory history);

	public List<SearchHistory> getAllByOpenId(HashMap<String, Object> map);
	
	public HashMap<String,Object> getHotKW();

}

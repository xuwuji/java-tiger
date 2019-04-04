package com.xuwuji.eshop.db.mapper;

import java.util.HashMap;
import java.util.List;

import com.xuwuji.eshop.model.History;

public interface HistoryMapper {

	public void add(History history);

	public List<History> getAllByOpenId(HashMap<String, Object> map);

}

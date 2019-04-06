package com.xuwuji.eshop.db.mapper;

import java.util.HashMap;
import java.util.List;

import com.xuwuji.eshop.model.ViewHistory;

public interface ViewHistoryMapper {

	public void add(ViewHistory history);

	public List<ViewHistory> getAllByOpenId(HashMap<String, Object> map);

}

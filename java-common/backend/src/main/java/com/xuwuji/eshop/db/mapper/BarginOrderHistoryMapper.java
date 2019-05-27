package com.xuwuji.eshop.db.mapper;

import java.util.HashMap;
import java.util.List;

import com.xuwuji.eshop.model.BarginOrderHistory;

public interface BarginOrderHistoryMapper {

	public void add(BarginOrderHistory barginOrderHistory);

	public List<BarginOrderHistory> getByBarginOrderId(HashMap<String, Object> map);

	public List<BarginOrderHistory> checkExist(HashMap<String, Object> map);

}

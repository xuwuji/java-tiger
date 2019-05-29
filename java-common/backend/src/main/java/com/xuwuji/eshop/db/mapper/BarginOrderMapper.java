package com.xuwuji.eshop.db.mapper;

import java.util.HashMap;
import java.util.List;

import com.xuwuji.eshop.model.BarginOrder;

public interface BarginOrderMapper {

	public int add(BarginOrder barginItem);

	public List<BarginOrder> getByOpenId(HashMap<String, Object> map);

	public void update(HashMap<String, Object> map);

	public List<BarginOrder> getByBarginOrderId(HashMap<String, Object> map);

	public List<BarginOrder> getById(HashMap<String, Object> map);

	public void updateState(HashMap<String, Object> map);

	public List<BarginOrder> getByOpenIdAndState(HashMap<String, Object> map);

	public List<BarginOrder> isJoined(HashMap<String, Object> map);

}

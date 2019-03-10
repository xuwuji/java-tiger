package com.xuwuji.eshop.db.mapper;

import java.util.HashMap;
import java.util.List;

import com.xuwuji.eshop.model.Order;

public interface OrderMapper {

	public Order add(HashMap<String, Object> map);

	public void update(HashMap<String, Object> map);

	public List<Order> getAllByWechatIdAndStatus(HashMap<String, Object> map);

	public List<Order> getAllByOpenIdAndStatus(HashMap<String, Object> map);
}

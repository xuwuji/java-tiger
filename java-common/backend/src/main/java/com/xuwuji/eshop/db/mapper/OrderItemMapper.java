package com.xuwuji.eshop.db.mapper;

import java.util.HashMap;
import java.util.List;

import com.xuwuji.eshop.model.OrderItem;

public interface OrderItemMapper {

	public void add(HashMap<String, Object> map);

	public List<OrderItem> getByOrderId(HashMap<String, Object> map);
}

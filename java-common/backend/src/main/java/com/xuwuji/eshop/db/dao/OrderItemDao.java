package com.xuwuji.eshop.db.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.mapper.OrderItemMapper;
import com.xuwuji.eshop.db.util.SessionFactory;
import com.xuwuji.eshop.model.OrderItem;

@Component
public class OrderItemDao {

	public void add(OrderItem orderItem) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			OrderItemMapper mapper = session.getMapper(OrderItemMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("name", orderItem.getName());
			map.put("mainImgUrl", orderItem.getMainImgUrl());
			map.put("price", orderItem.getPrice());
			map.put("count", orderItem.getCount());
			map.put("orderId", orderItem.getOrderId());
			map.put("formatId", orderItem.getFormatId());
			map.put("productId", orderItem.getProductId());
			map.put("formatName", orderItem.getFormatName());
			mapper.add(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public List<OrderItem> getByOrderId(String orderId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<OrderItem> result = new ArrayList<OrderItem>();
		try {
			OrderItemMapper mapper = session.getMapper(OrderItemMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("orderId", orderId);
			result = mapper.getByOrderId(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

}

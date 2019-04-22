package com.xuwuji.eshop.db.mapper;

import java.util.HashMap;
import java.util.List;

import com.xuwuji.eshop.model.Coupon;

public interface CouponMapper {

	public void add(HashMap<String, Object> map);

	public void update(HashMap<String, Object> map);

	public void disable(HashMap<String, Object> map);

	public void reActive(HashMap<String, Object> map);

	public List<Coupon> getById(HashMap<String, Object> map);

	public List<Coupon> getAll();

	public List<Coupon> getActiveAll();

	public List<Coupon> getActiveAllByCouponId(HashMap<String, Object> map);
}

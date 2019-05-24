package com.xuwuji.eshop.db.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.mapper.CouponMapper;
import com.xuwuji.eshop.db.util.SessionFactory;
import com.xuwuji.eshop.model.Coupon;

@Component
public class CouponDao {

	public void add(Coupon coupon) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			CouponMapper mapper = session.getMapper(CouponMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("name", coupon.getName());
			map.put("total", coupon.getTotal());
			map.put("targetUser", coupon.getTargetUser());
			map.put("reduction", coupon.getReduction());
			map.put("startDate", coupon.getStartDate());
			map.put("endDate", coupon.getEndDate());
			map.put("type", coupon.getType());
			map.put("targetUser", coupon.getTargetUser());
			mapper.add(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public void update(Coupon coupon) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			CouponMapper mapper = session.getMapper(CouponMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("name", coupon.getName());
			map.put("total", coupon.getTotal());
			map.put("reduction", coupon.getReduction());
			map.put("targetUser", coupon.getTargetUser());
			map.put("id", coupon.getId());
			// map.put("startDate", coupon.getStartDate());
			// map.put("endDate", coupon.getEndDate());
			map.put("type", coupon.getType());
			map.put("state", coupon.getState());
			map.put("targetUser", coupon.getTargetUser());
			mapper.update(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public void disable(String id) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			CouponMapper mapper = session.getMapper(CouponMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			mapper.disable(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	};

	public void reActive(String id) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			CouponMapper mapper = session.getMapper(CouponMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			mapper.reActive(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	};

	public List<Coupon> getAll() {
		SqlSession session = SessionFactory.openDEVSession();
		List<Coupon> result = new ArrayList<Coupon>();
		try {
			CouponMapper mapper = session.getMapper(CouponMapper.class);
			result = mapper.getAll();
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public List<Coupon> getActiveAll() {
		SqlSession session = SessionFactory.openDEVSession();
		List<Coupon> result = new ArrayList<Coupon>();
		try {
			CouponMapper mapper = session.getMapper(CouponMapper.class);
			result = mapper.getActiveAll();
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public List<Coupon> getById(String id) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Coupon> result = new ArrayList<Coupon>();
		try {
			CouponMapper mapper = session.getMapper(CouponMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			result = mapper.getById(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public List<Coupon> getActiveAllByCouponId(String CouponId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Coupon> result = new ArrayList<Coupon>();
		try {
			CouponMapper mapper = session.getMapper(CouponMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", CouponId);
			result = mapper.getActiveAllByCouponId(map);
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

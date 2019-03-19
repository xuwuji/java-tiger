package com.xuwuji.eshop.db.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.mapper.PromotionMapper;
import com.xuwuji.eshop.db.util.SessionFactory;
import com.xuwuji.eshop.model.Brand;
import com.xuwuji.eshop.model.Promotion;

@Component
public class PromotionDao {

	public void add(Promotion promotion) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			PromotionMapper mapper = session.getMapper(PromotionMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("name", promotion.getName());
			map.put("target", promotion.getTarget());
			map.put("type", promotion.getType());
			map.put("amount", promotion.getAmount());
			map.put("reduction", promotion.getReduction());
			map.put("gift", promotion.getGift());
			map.put("brandId", promotion.getBrandId());
			map.put("categoryId", promotion.getCategoryId());
			map.put("rule", promotion.getRule());
			map.put("total", promotion.getTotal());
			mapper.add(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public void update(Promotion promotion) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			PromotionMapper mapper = session.getMapper(PromotionMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", promotion.getId());
			map.put("name", promotion.getName());
			map.put("type", promotion.getType());
			map.put("target", promotion.getTarget());
			map.put("amount", promotion.getAmount());
			map.put("reduction", promotion.getReduction());
			map.put("gift", promotion.getGift());
			map.put("brandId", promotion.getBrandId());
			map.put("categoryId", promotion.getCategoryId());
			map.put("rule", promotion.getRule());
			map.put("total", promotion.getTotal());
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
			PromotionMapper mapper = session.getMapper(PromotionMapper.class);
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
			PromotionMapper mapper = session.getMapper(PromotionMapper.class);
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

	public List<Promotion> getAll() {
		SqlSession session = SessionFactory.openDEVSession();
		List<Promotion> result = new ArrayList<Promotion>();
		try {
			PromotionMapper mapper = session.getMapper(PromotionMapper.class);
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

	public List<Promotion> getActiveAll() {
		SqlSession session = SessionFactory.openDEVSession();
		List<Promotion> result = new ArrayList<Promotion>();
		try {
			PromotionMapper mapper = session.getMapper(PromotionMapper.class);
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

	public List<Promotion> getActiveAllByBrandId(String brandId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Promotion> result = new ArrayList<Promotion>();
		try {
			PromotionMapper mapper = session.getMapper(PromotionMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", brandId);
			result = mapper.getActiveAllByBrandId(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public List<Promotion> getActiveAllByCategoryId(String brandId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Promotion> result = new ArrayList<Promotion>();
		try {
			PromotionMapper mapper = session.getMapper(PromotionMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", brandId);
			result = mapper.getActiveAllByCategoryId(map);
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

package com.xuwuji.eshop.db.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.mapper.BannerItemMapper;
import com.xuwuji.eshop.db.util.SessionFactory;
import com.xuwuji.eshop.model.BannerItem;

@Component
public class BannerDao {

	public void add(BannerItem bannerItem) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			BannerItemMapper mapper = session.getMapper(BannerItemMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("name", bannerItem.getName());
			map.put("imgUrl", bannerItem.getImgUrl());
			map.put("redirectUrl", bannerItem.getRedirectUrl());
			map.put("state", bannerItem.getState());
			map.put("bannerId", bannerItem.getBannerId());
			mapper.add(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public void update(BannerItem bannerItem) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			BannerItemMapper mapper = session.getMapper(BannerItemMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("name", bannerItem.getName());
			map.put("imgUrl", bannerItem.getImgUrl());
			map.put("redirectUrl", bannerItem.getRedirectUrl());
			map.put("state", bannerItem.getState());
			map.put("bannerId", bannerItem.getBannerId());
			map.put("id", bannerItem.getId());
			mapper.update(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public void disable(String bannerItemId) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			BannerItemMapper mapper = session.getMapper(BannerItemMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", bannerItemId);
			mapper.disable(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	};

	public void reActive(String bannerItemId) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			BannerItemMapper mapper = session.getMapper(BannerItemMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", bannerItemId);
			mapper.reActive(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	};

	public List<BannerItem> getAll() {
		SqlSession session = SessionFactory.openDEVSession();
		List<BannerItem> result = new ArrayList<BannerItem>();
		try {
			BannerItemMapper mapper = session.getMapper(BannerItemMapper.class);
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

	public List<BannerItem> getById(String id) {
		SqlSession session = SessionFactory.openDEVSession();
		List<BannerItem> result = new ArrayList<BannerItem>();
		try {
			BannerItemMapper mapper = session.getMapper(BannerItemMapper.class);
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

	public List<BannerItem> getAllActive() {
		SqlSession session = SessionFactory.openDEVSession();
		List<BannerItem> result = new ArrayList<BannerItem>();
		try {
			BannerItemMapper mapper = session.getMapper(BannerItemMapper.class);
			result = mapper.getAllActive();
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public List<BannerItem> getActiveAllByBannerId(String bannerId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<BannerItem> result = new ArrayList<BannerItem>();
		try {
			BannerItemMapper mapper = session.getMapper(BannerItemMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bannerId", bannerId);
			result = mapper.getActiveAllByBannerId(map);
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

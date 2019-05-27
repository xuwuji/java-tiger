package com.xuwuji.eshop.db.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.mapper.BarginItemMapper;
import com.xuwuji.eshop.db.util.SessionFactory;
import com.xuwuji.eshop.model.BarginItem;

@Component
public class BarginItemDao {

	public void add(BarginItem barginItem) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			BarginItemMapper mapper = session.getMapper(BarginItemMapper.class);
			mapper.add(barginItem);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public List<BarginItem> getAll() {
		SqlSession session = SessionFactory.openDEVSession();
		List<BarginItem> result = new ArrayList<BarginItem>();
		try {
			BarginItemMapper mapper = session.getMapper(BarginItemMapper.class);
			result = mapper.getAll();
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	};

	public void disable(String id) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			BarginItemMapper mapper = session.getMapper(BarginItemMapper.class);
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
			BarginItemMapper mapper = session.getMapper(BarginItemMapper.class);
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

	public void update(BarginItem barginItem) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			BarginItemMapper mapper = session.getMapper(BarginItemMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("name", barginItem.getName());
			map.put("stageOnePeople", barginItem.getStageOnePeople());
			map.put("stageOnePrice", barginItem.getStageOnePrice());
			map.put("stageTwoPeople", barginItem.getStageTwoPeople());
			map.put("stageTwoPrice", barginItem.getStageTwoPrice());
			map.put("lastHour", barginItem.getLastHour());
			mapper.update(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	};

	public List<HashMap<String, Object>> getActiveCategories() {
		SqlSession session = SessionFactory.openDEVSession();
		List<HashMap<String, Object>> result = new ArrayList<HashMap<String, Object>>();
		try {
			BarginItemMapper mapper = session.getMapper(BarginItemMapper.class);
			result = mapper.getActiveCategories();
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	};

	public List<BarginItem> getActiveByCategoryId(String categoryId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<BarginItem> result = new ArrayList<BarginItem>();
		try {
			BarginItemMapper mapper = session.getMapper(BarginItemMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("categoryId", categoryId);
			result = mapper.getActiveByCategoryId(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	};

	public BarginItem getById(String id) {
		SqlSession session = SessionFactory.openDEVSession();
		List<BarginItem> result = new ArrayList<BarginItem>();
		try {
			BarginItemMapper mapper = session.getMapper(BarginItemMapper.class);
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
		if (result.size() == 1) {
			return result.get(0);
		} else {
			return null;
		}

	}

	public List<BarginItem> getByCategoryId(String categoryId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<BarginItem> result = new ArrayList<BarginItem>();
		try {
			BarginItemMapper mapper = session.getMapper(BarginItemMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("categoryId", categoryId);
			result = mapper.getByCategoryId(map);
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

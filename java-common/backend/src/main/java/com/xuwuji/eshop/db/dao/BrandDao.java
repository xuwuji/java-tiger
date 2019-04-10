package com.xuwuji.eshop.db.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.mapper.BrandMapper;
import com.xuwuji.eshop.db.util.SessionFactory;
import com.xuwuji.eshop.model.Brand;

@Component
public class BrandDao {

	public void add(Brand brand) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			BrandMapper mapper = session.getMapper(BrandMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("brandCN", brand.getBrandCN());
			map.put("brandEN", brand.getBrandEN());
			map.put("country", brand.getCountry());
			map.put("brandLevel", brand.getBrandLevel());
			map.put("imgUrl", brand.getImgUrl());
			mapper.add(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public void update(Brand brand) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			BrandMapper mapper = session.getMapper(BrandMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("brandCN", brand.getBrandCN());
			map.put("brandEN", brand.getBrandEN());
			map.put("country", brand.getCountry());
			map.put("brandLevel", brand.getBrandLevel());
			map.put("imgUrl", brand.getImgUrl());
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
			BrandMapper mapper = session.getMapper(BrandMapper.class);
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
			BrandMapper mapper = session.getMapper(BrandMapper.class);
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

	public List<Brand> getAll() {
		SqlSession session = SessionFactory.openDEVSession();
		List<Brand> result = new ArrayList<Brand>();
		try {
			BrandMapper mapper = session.getMapper(BrandMapper.class);
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

	public List<Brand> getActiveAll() {
		SqlSession session = SessionFactory.openDEVSession();
		List<Brand> result = new ArrayList<Brand>();
		try {
			BrandMapper mapper = session.getMapper(BrandMapper.class);
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

	public List<Brand> getById(String id) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Brand> result = new ArrayList<Brand>();
		try {
			BrandMapper mapper = session.getMapper(BrandMapper.class);
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

	public List<Brand> getActiveAllByBrandId(String brandId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Brand> result = new ArrayList<Brand>();
		try {
			BrandMapper mapper = session.getMapper(BrandMapper.class);
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

	public List<Brand> getActiveAllByCountry(String country) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Brand> result = new ArrayList<Brand>();
		try {
			BrandMapper mapper = session.getMapper(BrandMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("country", country);
			result = mapper.getActiveAllByCountry(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public List<String> getActiveCountry() {
		SqlSession session = SessionFactory.openDEVSession();
		List<String> result = new ArrayList<String>();
		try {
			BrandMapper mapper = session.getMapper(BrandMapper.class);
			result = mapper.getActiveCountry();
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

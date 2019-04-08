package com.xuwuji.eshop.db.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.mapper.ProductMapper;
import com.xuwuji.eshop.db.util.SessionFactory;
import com.xuwuji.eshop.model.Product;
import com.xuwuji.eshop.util.EshopConfigUtil;

@Component
public class ProductDao {

	@Autowired
	private EshopConfigUtil eshopConfigUtil;

	@SuppressWarnings("static-access")
	public void add(Product product) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			mapper.add(product);
			int id = product.getId();
			HashMap<String, Object> imgMap = new HashMap<String, Object>();
			imgMap.put("id", id);
			imgMap.put("mainImgUrl", eshopConfigUtil.getParam(eshopConfigUtil.PRODUCT_IMG_BASE) + id + "-0.jpg");
			imgMap.put("imgUrl1", eshopConfigUtil.getParam(eshopConfigUtil.PRODUCT_IMG_BASE) + id + "-1.jpg");
			imgMap.put("imgUrl2", eshopConfigUtil.getParam(eshopConfigUtil.PRODUCT_IMG_BASE) + id + "-2.jpg");
			imgMap.put("imgUrl3", eshopConfigUtil.getParam(eshopConfigUtil.PRODUCT_IMG_BASE) + id + "-3.jpg");
			imgMap.put("imgUrl4", eshopConfigUtil.getParam(eshopConfigUtil.PRODUCT_IMG_BASE) + id + "-4.jpg");
			mapper.updateImgUrl(imgMap);
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
			ProductMapper mapper = session.getMapper(ProductMapper.class);
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
			ProductMapper mapper = session.getMapper(ProductMapper.class);
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

	public void updateBannerItem(String id, String bannerItemId) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("bannerItemId", bannerItemId);
			mapper.updateBannerItem(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	};

	public void updateBrand(String id, String brandId) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("brandId", brandId);
			mapper.updateBrand(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	};

	public void update(Product product) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", product.getId());
			map.put("name", product.getName());
			map.put("description", product.getDescription());
			map.put("price", product.getPrice());
			map.put("inventory", product.getInventory());
			map.put("salesCount", product.getSalesCount());
			map.put("mainImgUrl", product.getMainImgUrl());
			map.put("parentCategoryId", product.getParentCategoryId());
			map.put("categoryId", product.getCategoryId());
			map.put("flashPrice", product.getFlashPrice());
			map.put("flashState", product.getFlashState());
			// map.put("brandNameCN", product.getBrandNameCN());
			// map.put("brandNameEN", product.getBrandNameEN());
			mapper.update(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public List<Product> getByCategory(String categoryId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Product> result = new ArrayList<Product>();
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("categoryId", categoryId);
			result = mapper.getByCategory(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public List<Product> getDetailByCategory(String categoryId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Product> result = new ArrayList<Product>();
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("categoryId", categoryId);
			result = mapper.getDetailByCategory(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public List<Product> getActiveByCategory(String categoryId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Product> result = new ArrayList<Product>();
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("categoryId", categoryId);
			result = mapper.getActiveByCategory(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public Product getById(String productId) {
		SqlSession session = SessionFactory.openDEVSession();
		Product result = new Product();
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", productId);
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

	public List<Product> getActiveByKW(String KW) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Product> result = new ArrayList<Product>();
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("KW", KW);
			result = mapper.getActiveByKW(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public List<Product> getActiveByBannerItem(String bannerItemId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Product> result = new ArrayList<Product>();
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bannerItemId", bannerItemId);
			result = mapper.getActiveByBannerItem(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public List<Product> getActiveByBrandId(String brandId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Product> result = new ArrayList<Product>();
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("brandId", brandId);
			result = mapper.getActiveByBrandId(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public List<Product> getRankByTop() {
		SqlSession session = SessionFactory.openDEVSession();
		List<Product> result = new ArrayList<Product>();
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			result = mapper.getRankByTop();
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}
	
	public List<Product> getActiveByFlash() {
		SqlSession session = SessionFactory.openDEVSession();
		List<Product> result = new ArrayList<Product>();
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			result = mapper.getActiveByFlash();
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}
	
	public List<Product> getMultiByIds(List<Integer> ids) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Product> result = new ArrayList<Product>();
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("ids", ids);
			result = mapper.getMultiByIds(map);
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

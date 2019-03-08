package com.xuwuji.eshop.db.mapper;

import java.util.HashMap;
import java.util.List;

import com.xuwuji.eshop.model.BannerItem;

public interface BannerItemMapper {

	public void add(BannerItem bannerItem);

	public void updateImg(HashMap<String, Object> map);
	
	public void update(HashMap<String, Object> map);

	public void disable(HashMap<String, Object> map);

	public void reActive(HashMap<String, Object> map);

	public List<BannerItem> getAll();

	public List<BannerItem> getById(HashMap<String, Object> map);

	public List<BannerItem> getAllActive();

	public List<BannerItem> getActiveAllByBannerId(HashMap<String, Object> map);
}

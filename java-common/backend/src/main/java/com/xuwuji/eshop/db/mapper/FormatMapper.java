package com.xuwuji.eshop.db.mapper;

import java.util.HashMap;
import java.util.List;

import com.xuwuji.eshop.model.Format;

public interface FormatMapper {

	public void add(HashMap<String, Object> map);

	public void update(HashMap<String, Object> map);

	public void disable(HashMap<String, Object> map);

	public void reActive(HashMap<String, Object> map);

	public List<Format> getAllByProductId(HashMap<String, Object> map);

	public List<Format> getActiveByProductId(HashMap<String, Object> map);

	public List<Format> getById(HashMap<String, Object> map);
}

package com.xuwuji.eshop.db.mapper;

import java.util.List;

import com.xuwuji.eshop.model.TreasureItem;

public interface TreasureItemMapper {

	public void add(TreasureItem treasureItem);

	public List<TreasureItem> getActiveAll();

	public List<TreasureItem> getAll();

	public TreasureItem getById(String id);

	public void update(TreasureItem treasureItem);

	public void reactive(String id);

	public void disable(String id);
}

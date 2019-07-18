package com.xuwuji.eshop.db.mapper;

import java.util.List;

import com.xuwuji.eshop.model.EntitySale;

public interface EntitySaleMapper {

	public List<EntitySale> getActiveAllByEntityId(String entityId);

	public List<EntitySale> getByEntityId(String entityId);

	public void add(EntitySale entitySale);

	public void disable(String id);

	public void reactive(String id);

}

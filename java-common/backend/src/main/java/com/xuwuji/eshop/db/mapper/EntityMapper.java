package com.xuwuji.eshop.db.mapper;

import java.util.List;

import com.xuwuji.eshop.model.Entity;

public interface EntityMapper {

	public List<Entity> getActiveAll();

	public Entity getByPhone(String phone);

	public Entity getById(String id);
}

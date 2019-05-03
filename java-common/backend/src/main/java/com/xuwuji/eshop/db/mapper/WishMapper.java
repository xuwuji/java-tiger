package com.xuwuji.eshop.db.mapper;

import java.util.List;

import com.xuwuji.eshop.model.Wish;

public interface WishMapper {

	public void add(Wish wish);

	public List<Wish> getAll();
}

package com.xuwuji.eshop.db.mapper;

import java.util.List;

import com.xuwuji.eshop.model.TreasureShare;

public interface TreasureShareMapper {

	public void add(TreasureShare treasureShare);

	public List<TreasureShare> checkExist(String sourceUser, String openUser, String joinHistoryId);

	public List<TreasureShare> getHelpInfo(String sourceUser, String joinHistoryId);
}

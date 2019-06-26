package com.xuwuji.eshop.db.mapper;

import java.util.List;

import com.xuwuji.eshop.model.TreasureJoinHistory;

public interface TreasureJoinHistoryMapper {

	public void add(TreasureJoinHistory treasureJoinHistory);

	public void update(TreasureJoinHistory treasureJoinHistory);

	public List<TreasureJoinHistory> getByOpenIdAndTreasureId(String openId, String treasureItemId);

	public List<TreasureJoinHistory> isJoined(String openId, String treasureItemId);
}

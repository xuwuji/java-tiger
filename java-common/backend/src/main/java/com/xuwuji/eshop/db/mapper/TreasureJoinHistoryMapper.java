package com.xuwuji.eshop.db.mapper;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.xuwuji.eshop.model.TreasureJoinHistory;

@Transactional
public interface TreasureJoinHistoryMapper {

	public void add(TreasureJoinHistory treasureJoinHistory);

	public void update(TreasureJoinHistory treasureJoinHistory);

	public List<TreasureJoinHistory> getByOpenIdAndTreasureId(String openId, String treasureItemId);

	public List<TreasureJoinHistory> isJoined(String openId, String treasureItemId);

	public TreasureJoinHistory getById(String id);

}

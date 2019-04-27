package com.xuwuji.eshop.db.mapper;

import java.util.HashMap;
import java.util.List;

import com.xuwuji.eshop.model.LotteryHistory;

public interface LotteryHistoryMapper {

	public void add(LotteryHistory lotteryHistory);

	public List<LotteryHistory> getAllByOpenId(HashMap<String, Object> map);

}

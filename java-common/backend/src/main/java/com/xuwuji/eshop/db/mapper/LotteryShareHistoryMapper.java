package com.xuwuji.eshop.db.mapper;

import java.util.HashMap;
import java.util.List;

import com.xuwuji.eshop.model.LotteryHistory;
import com.xuwuji.eshop.model.LotteryShareHistory;

public interface LotteryShareHistoryMapper {

	public void add(LotteryShareHistory lotteryHistory);

	public List<LotteryShareHistory> getBysourceUser(HashMap<String, Object> map);

	public List<LotteryShareHistory> checkExist(HashMap<String, Object> map);
}

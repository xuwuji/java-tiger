package com.xuwuji.eshop.db.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.mapper.LotteryHistoryMapper;
import com.xuwuji.eshop.db.util.SessionFactory;
import com.xuwuji.eshop.model.LotteryHistory;

@Component
public class LotteryHistoryDao {

	public void add(LotteryHistory lotteryHistory) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			LotteryHistoryMapper mapper = session.getMapper(LotteryHistoryMapper.class);
			mapper.add(lotteryHistory);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public List<LotteryHistory> getByOpenId(String openId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<LotteryHistory> result = new ArrayList<LotteryHistory>();
		try {
			LotteryHistoryMapper mapper = session.getMapper(LotteryHistoryMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("openId", openId);
			result = mapper.getAllByOpenId(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

}

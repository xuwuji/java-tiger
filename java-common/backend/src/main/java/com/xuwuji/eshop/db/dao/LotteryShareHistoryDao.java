package com.xuwuji.eshop.db.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.mapper.LotteryShareHistoryMapper;
import com.xuwuji.eshop.db.util.SessionFactory;
import com.xuwuji.eshop.model.LotteryShareHistory;

@Component
public class LotteryShareHistoryDao {

	public void add(LotteryShareHistory lotteryShareHistory) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			LotteryShareHistoryMapper mapper = session.getMapper(LotteryShareHistoryMapper.class);
			mapper.add(lotteryShareHistory);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public List<LotteryShareHistory> getBysourceUser(String sourceUser) {
		SqlSession session = SessionFactory.openDEVSession();
		List<LotteryShareHistory> result = new ArrayList<LotteryShareHistory>();
		try {
			LotteryShareHistoryMapper mapper = session.getMapper(LotteryShareHistoryMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("sourceUser", sourceUser);
			result = mapper.getBysourceUser(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public List<LotteryShareHistory> checkExist(String sourceUser, String openUser) {
		SqlSession session = SessionFactory.openDEVSession();
		List<LotteryShareHistory> result = new ArrayList<LotteryShareHistory>();
		try {
			LotteryShareHistoryMapper mapper = session.getMapper(LotteryShareHistoryMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("sourceUser", sourceUser);
			map.put("openUser", openUser);
			result = mapper.checkExist(map);
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

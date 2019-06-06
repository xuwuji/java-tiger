package com.xuwuji.eshop.db.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.mapper.UserMapper;
import com.xuwuji.eshop.db.util.SessionFactory;
import com.xuwuji.eshop.model.User;

@Component
public class UserDao {

	public void add(User user) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("openId", user.getOpenId());
			map.put("wechatId", user.getWechatId());
			map.put("bonusAmount", user.getBonusAmount());
			map.put("state", user.getState());
			map.put("lastCheckInDate", user.getLastCheckInDate());
			map.put("continuousNum", user.getContinuousNum());
			map.put("points", user.getPoints());
			mapper.add(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public void update(User user) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("openId", user.getOpenId());
			map.put("state", user.getState());
			map.put("wechatId", user.getWechatId());
			map.put("bonusAmount", user.getBonusAmount());
			map.put("level", user.getLevel());
			map.put("totalPay", user.getTotalPay());
			map.put("membershipFirstDay", user.getMembershipFirstDay());
			map.put("amountAfterMSFD", user.getAmountAfterMSFD());
			map.put("amountThisMonth", user.getAmountThisMonth());
			map.put("points", user.getPoints());
			map.put("balance", user.getBalance());
			map.put("lotteryAmount", user.getLotteryAmount());
			mapper.update(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public void updateState(User user) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("openId", user.getOpenId());
			map.put("id", user.getId());
			map.put("state", user.getState());
			mapper.updateState(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public void updateBalance(String openId, double balance) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("openId", openId);
			map.put("balance", balance);
			mapper.updateBalance(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public void updatePoints(User user) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("openId", user.getOpenId());
			map.put("id", user.getId());
			map.put("points", user.getPoints());
			mapper.updatePoints(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public void updateLastCheckInDate(User user) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", user.getId());
			map.put("openId", user.getOpenId());
			map.put("lastCheckInDate", user.getLastCheckInDate());
			mapper.updateLastCheckInDate(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public void updateContinuousNum(User user) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", user.getId());
			map.put("openId", user.getOpenId());
			map.put("continuousNum", user.getContinuousNum());
			mapper.updateContinuousNum(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public void updatePointsInfo(User user) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", user.getId());
			map.put("openId", user.getOpenId());
			map.put("lastCheckInDate", user.getLastCheckInDate());
			map.put("continuousNum", user.getContinuousNum());
			map.put("points", user.getPoints());
			mapper.updatePointsInfo(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public void updateLotteryInfo(User user) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("openId", user.getOpenId());
			map.put("lotteryRemainCount", user.getLotteryRemainCount());
			map.put("lotteryTotalCount", user.getLotteryTotalCount());
			map.put("balance", user.getBalance());
			map.put("lotteryAmount", user.getLotteryAmount());
			map.put("points", user.getPoints());
			mapper.updateLotteryInfo(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public List<User> getAll() {
		SqlSession session = SessionFactory.openDEVSession();
		List<User> result = new ArrayList<User>();
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			result = mapper.getAll();
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

	public User getByCondition(User user) {
		SqlSession session = SessionFactory.openDEVSession();
		List<User> result = new ArrayList<User>();
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("openId", user.getOpenId());
			map.put("wechatId", user.getWechatId());
			result = mapper.getByCondition(map);
			if (result.size() == 1) {
				return result.get(0);
			}
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return new User();
	}

	public List<User> getAllByState(String state) {
		SqlSession session = SessionFactory.openDEVSession();
		List<User> result = new ArrayList<User>();
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("state", state);
			result = mapper.getAllByState(map);
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

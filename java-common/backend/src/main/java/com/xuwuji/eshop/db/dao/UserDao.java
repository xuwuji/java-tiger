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

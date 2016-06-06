package com.xuwuji.backend.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xuwuji.backend.mapper.UserMapper;
import com.xuwuji.backend.model.User;
import com.xuwuji.backend.util.SessionFactory;

@Component
public class UserDao {

	public List<User> getId(String username, String password) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			return mapper.getId(username, password);
		} finally {
			session.close();
		}
	}

	public List<User> checkName(String username) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			return mapper.getByName(username);
		} finally {
			session.close();
		}
	}

	public void insert(String username, String password) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			mapper.insertOneRecord(username, password);
			session.commit();
		} finally {
			session.close();
		}
	}

}

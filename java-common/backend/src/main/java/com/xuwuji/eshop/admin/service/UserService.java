package com.xuwuji.eshop.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.dao.UserDao;

@Component
public class UserService {

	@Autowired
	private UserDao userDao;

	public void updateUser(String openId) {
		// 1. 设置为老用户
		
		// 2.是够有分享红包
	}
}

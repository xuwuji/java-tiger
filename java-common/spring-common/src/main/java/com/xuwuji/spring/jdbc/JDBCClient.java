package com.xuwuji.spring.jdbc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

@Service
public class JDBCClient {

	@Autowired
	private JDBCDao dao;

	public void insertData() {
		dao.add();
	}

	public static void main(String[] args) {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("application-context.xml");
		JDBCClient client = (JDBCClient) ctx.getBean("jdbcClient");
		client.insertData();
		ctx.close();
	}

}

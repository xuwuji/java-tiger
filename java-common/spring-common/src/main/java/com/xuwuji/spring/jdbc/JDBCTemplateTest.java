package com.xuwuji.spring.jdbc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.xuwuji.spring.jdbc.model.Auth;

@Repository
public class JDBCTemplateTest {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void insertAuth(Auth auth) {
		String sql = "insert into auth (username,password,authority) values(?,?,?)";
		jdbcTemplate.update(sql, new Object[] { auth.getUsername(), auth.getPassword(), auth.getAuthority() });

	}

	public void getById(long id) {
		String sql = "select * from auth where id=?";
		jdbcTemplate.query(sql, new BeanPropertyRowMapper<Auth>());

	}

	public int getCount() {
		String sql = "select count(*) from auth";
		int count = jdbcTemplate.queryForObject(sql);
		return count;
	}

	public static void main(String[] args) {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("application-context.xml");
		JDBCTemplateTest test = (JDBCTemplateTest) ctx.getBean("JdbcTemplateTest");
		Auth auth = new Auth();
		auth.setUsername("a");
		auth.setPassword("b");
		auth.setAuthority(1);
		test.insertAuth(auth);
		ctx.close();
	}

}

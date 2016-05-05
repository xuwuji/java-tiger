package com.xuwuji.spring.jdbc;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class JDBCDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public void setDataSource(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Transactional
	public void add() {
		String sql = "INSERT INTO auth (username,password,authority) " + "VALUES ( ?, ?, ?)";
		String sql1 = "INSERT INTO auth (username1,password,authority) " + "VALUES ( ?, ?, ?)";
		jdbcTemplate.update(sql, new PreparedStatementSetter() {
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, "test");
				ps.setString(2, "test");
				ps.setInt(3, 2);
			}
		});
		jdbcTemplate.update(sql1);
	}

}

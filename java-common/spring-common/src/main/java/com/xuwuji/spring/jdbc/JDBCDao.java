package com.xuwuji.spring.jdbc;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

@Repository

public class JDBCDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private PlatformTransactionManager transactionManager;

	public void setDataSource(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	// @Transactional(readOnly = false)
	public void add() {
		TransactionDefinition def = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(def);
		try {
			String sql = "INSERT INTO auth (username,password,authority) " + "VALUES ( ?, ?, ?)";
			String sql1 = "INSERT INTO auth (username,password,authority) " + "VALUES ( 'a', ?, ?)";
			jdbcTemplate.update(sql, new PreparedStatementSetter() {
				public void setValues(PreparedStatement ps) throws SQLException {
					ps.setString(1, "test");
					ps.setString(2, "test");
					ps.setLong(3, System.currentTimeMillis() / 1000);
				}
			});
			jdbcTemplate.update(sql1, new Object[] { null, System.currentTimeMillis() / 1000 });
			transactionManager.commit(status);
		} catch (Exception e) {
			transactionManager.rollback(status);
		}
	}

	@Transactional(propagation = Propagation.REQUIRED)
	public void add1() throws Exception {

		String sql = "INSERT INTO auth (username,password,authority) " + "VALUES ( ?, ?, ?)";
		String sql1 = "INSERT INTO auth (username,password,authority) " + "VALUES ( 'a', ?, ?)";
		jdbcTemplate.update(sql, new PreparedStatementSetter() {
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, "test");
				ps.setString(2, "test");
				ps.setLong(3, System.currentTimeMillis() / 1000);
			}
		});
		// jdbcTemplate.update(sql1, new Object[] { null,
		// System.currentTimeMillis() / 1000 });
		int j = 1 / 0;
	}

	public static void main(String[] args) throws Exception {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("application-context.xml");
		JDBCClient client = (JDBCClient) ctx.getBean("jdbcClient");
		client.insertData1();
		try {
			Thread.sleep(20000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ctx.close();
	}
}

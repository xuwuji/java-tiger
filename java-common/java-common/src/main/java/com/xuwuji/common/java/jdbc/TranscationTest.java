package com.xuwuji.common.java.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Logger;

/**
 * 
 * If your JDBC Connection is in auto-commit mode, which it is by default, then
 * every SQL statement is committed to the database upon its completion.
 * 
 * That may be fine for simple applications, but there are three reasons why you
 * may want to turn off the auto-commit and manage your own transactions −
 * 
 * To increase performance.
 * 
 * To maintain the integrity of business processes.
 * 
 * To use distributed transactions.
 * 
 * Transactions enable you to control if, and when, changes are applied to the
 * database. It treats a single SQL statement or a group of SQL statements as
 * one logical unit, and if any statement fails, the whole transaction fails.
 * 
 * To enable manual- transaction support instead of the auto-commit mode that
 * the JDBC driver uses by default, use the Connection object's setAutoCommit()
 * method. If you pass a boolean false to setAutoCommit( ), you turn off
 * auto-commit. You can pass a boolean true to turn it back on again.
 * 
 * 
 * @author wuxu
 *
 */
public class TranscationTest {
	private final static Logger LOGGER = Logger.getLogger(TranscationTest.class.getName());

	// using statement
	public void save1() {
		Connection conn = ConnectionManager.getConn();
		try {
			// Assume a valid connection object conn
			/**
			 * If you pass a boolean false to setAutoCommit( ), you turn off
			 * auto-commit. You can pass a boolean true to turn it back on
			 * again.
			 */
			conn.setAutoCommit(false);
			Statement stmt = conn.createStatement();

			String SQL = "INSERT INTO auth  " + "VALUES (2, 'a', 'a', 2)";
			stmt.executeUpdate(SQL);
			// Submit a malformed SQL statement that breaks
			SQL = "INSERTED IN Employees  " + "VALUES (3, 'b', 'b', 2)";
			stmt.executeUpdate(SQL);
			// If there is no error.
			conn.commit();
		} catch (SQLException se) {
			// If there is any error.
			try {
				conn.rollback();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	// using PreparedStatement, it is faster and avoid sql injection
	public void save2() {
		Connection conn = ConnectionManager.getConn();
		try {
			// Assume a valid connection object conn
			/**
			 * If you pass a boolean false to setAutoCommit( ), you turn off
			 * auto-commit. You can pass a boolean true to turn it back on
			 * again.
			 */
			conn.setAutoCommit(false);
			PreparedStatement ps = null;
			String SQL = "INSERT INTO auth (username,password,authority)  " + "VALUES ('a', 'a',?)";
			ps = conn.prepareStatement(SQL);
			// the first parameter is 1, the second is 2, ...
			ps.setInt(1, (int) System.currentTimeMillis());
			ps.executeUpdate();
			// Submit a malformed SQL statement that breaks
			SQL = "INSERT INTO auth (us1ername,password,authority)  " + "VALUES ('a', 'a',?)";
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, (int) System.currentTimeMillis());
			ps.executeUpdate();
			// If there is no error.
			conn.commit();
			LOGGER.info("Successfully committed");
		} catch (SQLException se) {
			// If there is any error.
			try {
				LOGGER.warning("sql error, transcation rollback");
				conn.rollback();
			} catch (SQLException e) {
				LOGGER.warning("cannot rollback");
				e.printStackTrace();
			}
		}
	}

	public void update(String name) {
		Connection conn = ConnectionManager.getConn();
		try {
			// Assume a valid connection object conn
			/**
			 * If you pass a boolean false to setAutoCommit( ), you turn off
			 * auto-commit. You can pass a boolean true to turn it back on
			 * again.
			 */
			conn.setAutoCommit(false);
			PreparedStatement ps = null;
			String SQL = "update auth username = ?  and authority = ? " + "where password='a' ";
			ps = conn.prepareStatement(SQL);
			// the first parameter is 1, the second is 2, ...
			ps.setString(1, name);
			ps.setInt(2, (int) System.currentTimeMillis());
			ps.executeUpdate();
			conn.commit();
			LOGGER.info("Successfully committed");
		} catch (SQLException se) {
			// If there is any error.
			try {
				LOGGER.warning("sql error, transcation rollback");
				conn.rollback();
			} catch (SQLException e) {
				LOGGER.warning("cannot rollback");
				e.printStackTrace();
			}
		}
	}

	public void select() {
		Connection conn = ConnectionManager.getConn();
		try {
			// Assume a valid connection object conn
			/**
			 * If you pass a boolean false to setAutoCommit( ), you turn off
			 * auto-commit. You can pass a boolean true to turn it back on
			 * again.
			 */
			conn.setAutoCommit(false);
			PreparedStatement ps = null;
			String SQL = "select * from  auth ";
			ps = conn.prepareStatement(SQL);
			ResultSet result = ps.executeQuery();
			while (result.next()) {
				// the first column is 0, the second is 1, ...
				String name = result.getString(1);
				System.out.printf("username: %s \n", name);
			}
			conn.commit();
			LOGGER.info("Successfully committed");
		} catch (SQLException se) {
			// If there is any error.
			try {
				LOGGER.warning("sql error, transcation rollback");
				conn.rollback();
			} catch (SQLException e) {
				LOGGER.warning("cannot rollback");
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) {
		TranscationTest test = new TranscationTest();
		test.save2();
		// test.select();
	}

}

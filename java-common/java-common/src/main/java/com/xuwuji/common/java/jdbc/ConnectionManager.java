package com.xuwuji.common.java.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * To connect the db
 * 
 * @author wuxu
 *
 */
public class ConnectionManager {

	private final static String username = "root";
	private final static String password = "root";
	private final static String driver = "com.mysql.cj.jdbc.Driver";
	private final static String DB_URL = "jdbc:mysql://localhost:3306/wechat?autoReconnect=true&useSSL=false";

	public static Connection getConn() {
		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(DB_URL, username, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

}

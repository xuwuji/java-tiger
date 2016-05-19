package com.xuwuji.news.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.ibatis.datasource.DataSourceFactory;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * factory to get mybatis sql session
 * 
 * @author wuxu
 *
 */
public class SessionFactory {

	private static SqlSessionFactory instance;
	private static final Properties PROPERTIES = new Properties();

	static {
		try {
			InputStream is = SessionFactory.class.getClassLoader().getResourceAsStream("application.properties");
			PROPERTIES.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static SqlSessionFactory getInstance() {
		if (instance == null) {
			InputStream inputStream = null;
			try {
				inputStream = Resources.getResourceAsStream("mybatis-config.xml");
				instance = new SqlSessionFactoryBuilder().build(inputStream);
			} catch (IOException e) {
				throw new RuntimeException(e.getCause());
			} finally {
				if (inputStream != null) {
					try {
						inputStream.close();
					} catch (IOException e) {
					}
				}
			}
		}
		return instance;
	}

	public static SqlSession openSession() {
		return getInstance().openSession();
	}

}

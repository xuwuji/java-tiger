package com.xuwuji.backend.util;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

import com.xuwuji.db.dao.MetaDao;
import com.xuwuji.db.dao.NewsDao;
import com.xuwuji.db.dao.UserDao;
import com.xuwuji.db.service.QueryService;

@Configuration
public class BackendConfig {

	/**
	 * The default scope is singleton, but you can override this with the @Scope
	 * annotation
	 * 
	 * @return
	 */
	@Bean
	@Scope("singleton")
	public NewsDao newsDao() {
		return new NewsDao();
	}

	@Bean
	public MetaDao metaDao() {
		return new MetaDao();
	}

	@Bean
	public UserDao userDao() {
		return new UserDao();
	}

	@Bean
	public QueryService client() {
		return new QueryService();
	}

}

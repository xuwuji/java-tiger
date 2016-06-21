package com.xuwuji.backend.cache;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

/**
 * control the users' session info
 * 
 * @author wuxu
 *
 */
@Service
public class SessionCacheUtil {

	@Autowired
	private JedisPool jedisPool;
	private final static String sessionKey = "session@";

	/**
	 * set the session Id for a user
	 * 
	 * @param username
	 * @param sessionId
	 */
	public void insertSession(String username, String sessionId) {
		Jedis jedis = jedisPool.getResource();
		String key = sessionKey + username;
		String value = sessionId;
		jedis.set(key, value);
		jedis.close();
	}

	public String getSessionId(String username) {
		Jedis jedis = jedisPool.getResource();
		String key = sessionKey + username;
		String sessionId = jedis.get(key);
		jedis.close();
		return sessionId;
	}

	public void deleteSession(String username) {
		Jedis jedis = jedisPool.getResource();
		String key = sessionKey + username;
		jedis.del(key);
		jedis.close();
	}

}

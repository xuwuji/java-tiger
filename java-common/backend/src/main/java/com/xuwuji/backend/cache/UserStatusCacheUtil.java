package com.xuwuji.backend.cache;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuwuji.common.java.util.TimeUtil;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@Service
public class UserStatusCacheUtil {

	private static final String LASTLOGIN = "lastlogin@";
	private static final String LASTCOMMAND = "lastcommond@";
	private static final String LASTCOMMANDTIME = "lastcommondtime@";

	@Autowired
	private JedisPool jedisPool;

	public String getLastLogin(String username) {
		Jedis jedis = jedisPool.getResource();
		String key = LASTLOGIN + username;
		String result = jedis.get(key);
		jedis.close();
		return result;
	}

	public void setLastLogin(String username) {
		Jedis jedis = jedisPool.getResource();
		jedis.mset(LASTLOGIN + username, TimeUtil.currentTimewithMinutes());
		jedis.close();
	}

	public String getLastCommand(String username) {
		Jedis jedis = jedisPool.getResource();
		String key = LASTCOMMAND + username;
		String result = jedis.get(key);
		jedis.close();
		return result;
	}

	public void setLastCommand(String username) {
		Jedis jedis = jedisPool.getResource();
		jedis.mset(LASTCOMMAND + username, TimeUtil.currentTimewithMinutes());
		jedis.close();
	}

	public String getLastCommandTime(String username) {
		Jedis jedis = jedisPool.getResource();
		String key = LASTCOMMANDTIME + username;
		String result = jedis.get(key);
		jedis.close();
		return result;
	}

	public void setLastCommandTime(String username) {
		Jedis jedis = jedisPool.getResource();
		jedis.mset(LASTCOMMANDTIME + username, TimeUtil.currentTimewithMinutes());
		jedis.close();
	}

	public void addSession() {

	}

}

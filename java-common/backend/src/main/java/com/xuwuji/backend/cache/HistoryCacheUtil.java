package com.xuwuji.backend.cache;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuwuji.common.java.util.TimeUtil;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@Service
public class HistoryCacheUtil {

	private static final String HISTORY = "history@newswatched@";
	@Autowired
	private JedisPool jedisPool;

	public void addHistory(String username, String NewsId) {
		Jedis jedis = jedisPool.getResource();
		String key = HISTORY + username;
		String value = NewsId + "@" + TimeUtil.currentTimewithMinutes();
		jedis.lpush(key, value);
		jedis.close();
	}

	public List<String> getLatestWatchedHistory(String username) {
		Jedis jedis = jedisPool.getResource();
		String key = HISTORY + username;
		Long length = jedis.llen(key);
		List<String> list = new ArrayList<String>();
		if (length > 10) {
			list = jedis.lrange(key, length - 10, length);
		} else {
			list = jedis.lrange(key, 0, length);
		}
		jedis.close();
		return list;
	}

	public List<String> getAllWatchedHistory(String username) {
		Jedis jedis = jedisPool.getResource();
		String key = HISTORY + username;
		Long length = jedis.llen(key);
		List<String> list = new ArrayList<String>();
		list = jedis.lrange(key, 0, length);
		jedis.close();
		return list;
	}

}

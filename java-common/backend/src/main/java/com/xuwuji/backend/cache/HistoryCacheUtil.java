package com.xuwuji.backend.cache;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuwuji.common.java.util.TimeUtil;

import redis.clients.jedis.Jedis;

@Service
public class HistoryCacheUtil {

	private static final String HISTORY = "history@newswatched@";
	@Autowired
	private Jedis jedis;

	public void addHistory(String username, String NewsId) {
		String key = HISTORY + username;
		String value = NewsId + "@" + TimeUtil.currentTimewithMinutes();
		jedis.lpush(key, value);
	}

	public List<String> getLatestWatchedHistory(String username) {
		String key = HISTORY + username;
		Long length = jedis.llen(key);
		List<String> list = new ArrayList<String>();
		if (length > 10) {
			list = jedis.lrange(key, length - 10, length);
		} else {
			list = jedis.lrange(key, 0, length);
		}
		return list;
	}

	public List<String> getAllWatchedHistory(String username) {
		String key = HISTORY + username;
		Long length = jedis.llen(key);
		List<String> list = new ArrayList<String>();
		list = jedis.lrange(key, 0, length);
		return list;
	}

}

package com.xuwuji.backend.cache;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuwuji.common.java.util.TimeUtil;

import redis.clients.jedis.Jedis;

@Service
public class UserStatusCacheUtil {

	private static final String LASTLOGIN = "lastlogin@";
	private static final String LASTCOMMAND = "lastcommond@";
	private static final String LASTCOMMANDTIME = "lastcommondtime@";

	@Autowired
	private Jedis jedis;

	public String getLastLogin(String username) {
		String key = LASTLOGIN + username;
		String result = jedis.get(key);
		return result;
	}

	public void setLastLogin(String username) {
		jedis.mset(LASTLOGIN + username, TimeUtil.currentTimewithMinutes());
	}

	public String getLastCommand(String username) {
		String key = LASTCOMMAND + username;
		String result = jedis.get(key);
		return result;
	}

	public void setLastCommand(String username) {
		jedis.mset(LASTCOMMAND + username, TimeUtil.currentTimewithMinutes());
	}

	public String getLastCommandTime(String username) {
		String key = LASTCOMMANDTIME + username;
		String result = jedis.get(key);
		return result;
	}

	public void setLastCommandTime(String username) {
		jedis.mset(LASTCOMMANDTIME + username, TimeUtil.currentTimewithMinutes());
	}

}

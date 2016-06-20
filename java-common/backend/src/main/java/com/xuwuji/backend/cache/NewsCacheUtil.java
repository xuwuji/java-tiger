package com.xuwuji.backend.cache;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuwuji.common.java.util.TimeUtil;
import com.xuwuji.db.dao.NewsDao;
import com.xuwuji.db.model.News;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@Service
public class NewsCacheUtil {

	@Autowired
	private JedisPool jedisPool;
	@Autowired
	NewsDao dao;

	private void cacheHotNews(String time, String key) {
		Jedis jedis = jedisPool.getResource();
		String[] strs = key.split("@");
		String type = "";
		if (strs.length == 4) {
			type = strs[3];
		}
		List<News> list = dao.findHotNews(time, type);
		for (News news : list) {
			String value = news.getId() + "@" + news.getTitle() + "@" + news.getCommentNum() + "@" + news.getTime();
			jedis.zadd(key, news.getCommentNum(), value);
		}
		jedis.close();
	}

	/**
	 * store hot news of last 24 hours for each hour
	 * 
	 * @param type
	 * @return
	 */
	public List<News> getDailyCacheHotNews(String type) {
		Jedis jedis = jedisPool.getResource();
		String now = TimeUtil.currentTimewithHours();
		String key = "news@24@" + now + "@" + type;
		if (!jedis.exists(key)) {
			String past24hours = TimeUtil.getDateTimewithMinutes(DateTime.now().minusDays(1));
			cacheHotNews(past24hours, key);
		}
		jedis.close();
		return getList(key);
	}

	/**
	 * store all hot news for each day
	 * 
	 * @param type
	 * @return
	 */
	public List<News> getAllCacheHotNews(String type) {
		Jedis jedis = jedisPool.getResource();
		String today = TimeUtil.currentTimewithoutMinutes();
		String key = "news@all@" + today + "@" + type;
		if (!jedis.exists(key)) {
			cacheHotNews("", key);
		}
		return getList(key);
	}

	private List<News> getList(String key) {
		Jedis jedis = jedisPool.getResource();
		List<News> list = new ArrayList<News>();
		Set<String> set = jedis.zrangeByScore(key, 0, 10000000);
		for (String str : set) {
			News news = new News();
			String[] strs = str.split("@");
			news.setId(Integer.valueOf(strs[0]));
			news.setTitle(strs[1]);
			news.setCommentNum(Integer.valueOf(strs[2]));
			news.setTime(strs[3]);
			list.add(news);
		}
		jedis.close();
		return list;
	}
}

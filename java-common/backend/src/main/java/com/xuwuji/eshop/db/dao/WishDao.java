package com.xuwuji.eshop.db.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.mapper.WishMapper;
import com.xuwuji.eshop.db.util.SessionFactory;
import com.xuwuji.eshop.model.Wish;

@Component
public class WishDao {

	public void add(Wish wish) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			WishMapper mapper = session.getMapper(WishMapper.class);
			mapper.add(wish);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public List<Wish> getAll() {
		SqlSession session = SessionFactory.openDEVSession();
		List<Wish> result = new ArrayList<Wish>();
		try {
			WishMapper mapper = session.getMapper(WishMapper.class);
			result = mapper.getAll();
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
	}

}

package com.xuwuji.eshop.db.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.mapper.AddressMapper;
import com.xuwuji.eshop.db.util.SessionFactory;
import com.xuwuji.eshop.model.Address;

@Component
public class AddressDao {

	public Address add(Address Address) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			AddressMapper mapper = session.getMapper(AddressMapper.class);
			mapper.add(Address);
			session.commit();
			return Address;
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return Address;
	}

	public List<Address> getAllByOpenId(String openId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Address> result = new ArrayList<Address>();
		try {
			AddressMapper mapper = session.getMapper(AddressMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("openId", openId);
			result = mapper.getAllByOpenId(map);
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

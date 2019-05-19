package com.xuwuji.eshop.db.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.mapper.TranscationMapper;
import com.xuwuji.eshop.db.util.SessionFactory;
import com.xuwuji.eshop.model.Transcation;

@Component
public class TranscationDao {

	public Transcation add(Transcation transcation) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			TranscationMapper mapper = session.getMapper(TranscationMapper.class);
			mapper.add(transcation);
			session.commit();
			return transcation;
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return transcation;
	}

	public void updatePrepayId(Transcation transcation) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			TranscationMapper mapper = session.getMapper(TranscationMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("openId", transcation.getOpenId());
			map.put("lastModified", transcation.getLastModified());
			map.put("prePayId", transcation.getPrepayId());
			mapper.updatePrepayId(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}
}

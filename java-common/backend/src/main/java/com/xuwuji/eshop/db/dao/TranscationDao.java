package com.xuwuji.eshop.db.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.xuwuji.eshop.db.mapper.OrderMapper;
import com.xuwuji.eshop.db.mapper.TranscationMapper;
import com.xuwuji.eshop.db.util.SessionFactory;
import com.xuwuji.eshop.model.Order;
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

	public void update(Transcation transcation) {
		SqlSession session = SessionFactory.openDEVSession();
		try {
			TranscationMapper mapper = session.getMapper(TranscationMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("openId", transcation.getOpenId());
			map.put("lastModified", transcation.getLastModified());
			map.put("prePayId", transcation.getPrepayId());
			map.put("state", transcation.getState());
			map.put("wxTranscationId", transcation.getWxTranscationId());
			mapper.update(map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public Transcation getByTranscationId(String transcationId) {
		SqlSession session = SessionFactory.openDEVSession();
		List<Transcation> result = new ArrayList<Transcation>();
		try {
			TranscationMapper mapper = session.getMapper(TranscationMapper.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("transcationId", transcationId);
			result = mapper.getByTranscationId(map);
			session.commit();
			return result.get(0);
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result.get(0);
	}

}

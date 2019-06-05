package com.xuwuji.eshop.db.mapper;

import java.util.HashMap;
import java.util.List;

import com.xuwuji.eshop.model.Transcation;

public interface TranscationMapper {

	public void add(Transcation transcation);

	public List<Transcation> getByTranscationId(HashMap<String, Object> map);

	public void update(HashMap<String, Object> map);
	
	public List<Transcation> getByOpenIdAndType(HashMap<String, Object> map);

}

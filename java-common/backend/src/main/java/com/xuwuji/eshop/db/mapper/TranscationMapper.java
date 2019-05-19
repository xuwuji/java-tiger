package com.xuwuji.eshop.db.mapper;

import java.util.HashMap;
import java.util.List;

import com.xuwuji.eshop.model.Address;
import com.xuwuji.eshop.model.Transcation;

public interface TranscationMapper {

	public void add(Transcation transcation);

	
	public void updatePrepayId(HashMap<String, Object> map);

}

package com.xuwuji.eshop.db.mapper;

import java.util.List;

import com.xuwuji.eshop.model.EntityTranscation;

public interface EntityTranscationMapper {

	public void add(EntityTranscation entityTranscation);

	public List<EntityTranscation> getByEntityIdAndOpenId(String entityId, String openId);

	public List<EntityTranscation> getTranscationByPhoneAndEntityId(String phone, String entityId);
}

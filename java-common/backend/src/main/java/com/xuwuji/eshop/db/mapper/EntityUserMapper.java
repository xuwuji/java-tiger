package com.xuwuji.eshop.db.mapper;

import java.util.List;

import com.xuwuji.eshop.model.EntityUser;

public interface EntityUserMapper {

	public void add(EntityUser entityUser);

	public EntityUser getByPhoneAndEntityId(String phone, String entityId);

	public EntityUser getByWechatId(String wechaId);

	public List<EntityUser> getByOpenIdAndEntityId(String openId, String entityId);

	public void updateUserInfo(EntityUser entityUser);

}

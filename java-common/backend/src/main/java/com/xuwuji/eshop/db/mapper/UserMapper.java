package com.xuwuji.eshop.db.mapper;

import java.util.HashMap;
import java.util.List;

import com.xuwuji.eshop.model.User;

public interface UserMapper {

	public void add(HashMap<String, Object> map);
	
	public void update(HashMap<String, Object> map);

	public void updateState(HashMap<String, Object> map);

	public List<User> getByCondition(HashMap<String, Object> map);

	public List<User> getAll();

	public List<User> getAllByState(HashMap<String, Object> map);
	
}

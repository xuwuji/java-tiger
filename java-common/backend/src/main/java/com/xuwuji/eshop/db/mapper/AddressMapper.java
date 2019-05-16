package com.xuwuji.eshop.db.mapper;

import java.util.HashMap;
import java.util.List;

import com.xuwuji.eshop.model.Address;

public interface AddressMapper {

	public void add(Address address);
	
	public void delete(String id);

	public List<Address> getAllByOpenId(HashMap<String, Object> map);

}

package com.xuwuji.backend.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xuwuji.backend.model.User;

public interface UserMapper {

	List<User> getId(@Param("username") String username, @Param("password") String password);

	List<User> getByName(@Param("username") String username);

	void insertOneRecord(@Param("username") String username, @Param("password") String password);

}

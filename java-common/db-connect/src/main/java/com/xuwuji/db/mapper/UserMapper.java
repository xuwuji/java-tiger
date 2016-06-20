package com.xuwuji.db.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xuwuji.db.model.User;

public interface UserMapper {

	List<User> getId(@Param("username") String username, @Param("password") String password);

	List<User> getByName(@Param("username") String username);

	void insertOneRecord(@Param("username") String username, @Param("password") String password);

	void updateImg(@Param("id") int id, @Param("imgLink") String imgLink);

}

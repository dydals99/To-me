package com.edu.springboot.jdbc;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IUserService {

	public UserDTO login_act(String email, String password);
	public int signUp_act(UserDTO dto);
	public List<UserDTO> select_user();
}
  
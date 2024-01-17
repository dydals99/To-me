package com.edu.springboot.jdbc;

import lombok.Data;

@Data
public class UserDTO {
	int userIdx;
	String email;
	String password;
	String name;
}

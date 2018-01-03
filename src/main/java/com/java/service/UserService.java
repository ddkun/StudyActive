package com.java.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.mapper.UserMapper;
import com.java.pojo.User;

@Service
public class UserService {

	@Autowired
	private UserMapper userMapper;
	
	/**
	 * 用户登录
	 * @param user
	 * @return
	 */
	public User findAccount(User user) {
		User u = userMapper.getUser(user);
		return u==null?null:u;
	}
}

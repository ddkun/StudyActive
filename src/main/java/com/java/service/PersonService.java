package com.java.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.mapper.UserMapper;
import com.java.pojo.User;

@Service
public class PersonService {

	@Autowired
	private UserMapper userMapper;

	/**
	 * 更改个人信息
	 * @param user
	 * @return
	 */
	public Integer update(User user) {
		return userMapper.update(user);
	}
	
	
}

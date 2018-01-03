package com.java.mapper;

import com.java.annotation.Responsity;
import com.java.pojo.User;

@Responsity
public interface UserMapper {
    /**
     * 用户自定义
     * @param user
     * @return
     */
	User getUser(User user);

	Integer update(User user);
}
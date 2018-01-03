package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.mapper.GroupMapper;
import com.java.pojo.Group;

@Service
public class GroupService {

	@Autowired
	private GroupMapper groupMapper;

	/**
	 * 获取小组列表
	 * @param account
	 * @return
	 */
	public List<Group> getGroup(Long account) {
		// TODO Auto-generated method stub
		return groupMapper.getGroup(account);
	}

	/**
	 * 更改组名
	 * @param account
	 * @param name
	 * @return
	 */
	public Integer updateName(Long account, String name) {
		// TODO Auto-generated method stub
		return groupMapper.updateName(account,name);
	}
	
	
}

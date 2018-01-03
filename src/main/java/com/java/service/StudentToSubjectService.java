package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.mapper.StudentToSubjectMapper;
import com.java.pojo.StudentToSubject;

@Service
public class StudentToSubjectService {

	@Autowired
	private StudentToSubjectMapper studentToSubjectMapper;
	
	/**
	 * 获取学生课程列表
	 * @param account
	 * @return
	 */
	public List<StudentToSubject> getSubject(Long account) {
		// TODO Auto-generated method stub
		return studentToSubjectMapper.getSubject(account);
	}

	/**
	 * 获取学生课程数目
	 * @param account
	 * @return
	 */
	public Integer getSubjectCount(Long account) {
		// TODO Auto-generated method stub
		return studentToSubjectMapper.getSubjectCount(account);
	}

}

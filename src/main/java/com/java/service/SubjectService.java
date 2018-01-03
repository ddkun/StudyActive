package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.mapper.SubjectMapper;
import com.java.pojo.Subject;

@Service
public class SubjectService {

	@Autowired
	private SubjectMapper subjectMapper;
	
	
	/**
	 * 获取老师课堂数目
	 * @param account
	 * @return
	 */
	public Integer getSubjectCount(Long account) {
		// TODO Auto-generated method stub
		return subjectMapper.getSubjectCount(account);
	}

	/**
	 * 获取老师课程列表
	 * @param account
	 * @return
	 */
	public List<Subject> getSubject(Long account) {
		// TODO Auto-generated method stub
		return subjectMapper.getSubject(account);
	}

	/**
	 * 老师开课操作
	 * @param cid
	 * @return
	 */
	public Integer openClass(Integer cid) {
		// TODO Auto-generated method stub
		return subjectMapper.openClass(cid);
	}
	
	/**
	 * 老师结课操作
	 * @param cid
	 * @return
	 */
	public Integer closeSubject(Integer classid) {
		// TODO Auto-generated method stub
		return subjectMapper.closeSubject(classid);
	}

}

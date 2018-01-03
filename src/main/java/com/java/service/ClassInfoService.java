package com.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.mapper.ClassInfoMapper;
import com.java.pojo.ClassInfo;

@Service
public class ClassInfoService {
	
	@Autowired
	private ClassInfoMapper classInfoMapper;

	/**
	 * 获取课程章节
	 * @param classid
	 * @return
	 */
	public List<ClassInfo> getClassInfo(Integer classid) {
		// TODO Auto-generated method stub
		return classInfoMapper.getClassInfo(classid);
	}

	/**
	 * 进行学生上课或老师讲课操作
	 * @param ciid
	 */
	public void goClassInfo(Integer ciid) {
		// TODO Auto-generated method stub
		classInfoMapper.goClassInfo(ciid);
	}


}

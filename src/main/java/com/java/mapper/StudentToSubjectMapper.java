package com.java.mapper;

import java.util.List;

import com.java.annotation.Responsity;
import com.java.pojo.StudentToSubject;

@Responsity
public interface StudentToSubjectMapper {
    /**
     * 用户自定义
     * @param account
     * @return
     */
	List<StudentToSubject> getSubject(Long account);

	Integer getSubjectCount(Long account);
}
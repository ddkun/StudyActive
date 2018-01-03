package com.java.mapper;

import java.util.List;

import com.java.annotation.Responsity;
import com.java.pojo.Subject;

@Responsity
public interface SubjectMapper {
    /**
     * 用户自定义
     * @param account
     * @return
     */
	List<Subject> getSubject(Long account);

	Integer getSubjectCount(Long account);

	Integer openClass(Integer cid);

	Integer closeSubject(Integer classid);
}
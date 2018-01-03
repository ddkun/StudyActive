package com.java.mapper;

import java.util.List;

import com.java.annotation.Responsity;
import com.java.pojo.ClassInfo;

@Responsity
public interface ClassInfoMapper {
    /**
     * 用户自定义
     * @param classid
     * @return
     */
	List<ClassInfo> getClassInfo(Integer classid);

	void goClassInfo(Integer ciid);
}
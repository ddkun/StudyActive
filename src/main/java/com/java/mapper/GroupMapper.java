package com.java.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.java.annotation.Responsity;
import com.java.pojo.Group;

@Responsity
public interface GroupMapper {
    /**
     * 用户自定义
     * @param classid
     * @return
     */
	List<Group> getGroup(Long account);

	Integer updateName(@Param("account")Long account,@Param("name")String name);
}
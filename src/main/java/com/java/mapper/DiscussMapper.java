package com.java.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.java.annotation.Responsity;
import com.java.pojo.Discuss;

@Responsity
public interface DiscussMapper {

	List<Discuss> getDiscuss();

	Integer deleteDiscuss(Integer did);

	Integer saveDiscuss(@Param("discussTitle") String discussTitle, 
			@Param("did") Integer did,@Param("date") Date date);

	Discuss findDiscuss(@Param("did") Integer did);
    
}
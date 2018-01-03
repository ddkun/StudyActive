package com.java.mapper;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

import com.java.annotation.Responsity;

@Responsity
public interface SignMapper {
    /**
     * 用户自定义
     * @param classid
     * @param account
     * @param host
     * @param date
     * @return
     */
	Integer sign(@Param("classid")Integer classid, @Param("account")Long account, @Param("host")String host, @Param("date")Date date);
}
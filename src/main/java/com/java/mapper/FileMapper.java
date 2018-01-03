package com.java.mapper;

import java.io.File;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.java.annotation.Responsity;

@Responsity
public interface FileMapper {
    int insert(@Param("file") String file ,@Param("size") String size);

	List<File> select();
} 
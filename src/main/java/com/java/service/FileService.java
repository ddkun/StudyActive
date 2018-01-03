package com.java.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.mapper.FileMapper;

@Service
public class FileService {

	@Autowired
	private FileMapper fileMapper;

	public Integer insert(String path, double d){
		String size = String.valueOf(d);
		return fileMapper.insert(path,size.substring(0, 4)+"kb");
	}

	public List<File> select() {
		// TODO Auto-generated method stub
		return fileMapper.select();
	}
	
}

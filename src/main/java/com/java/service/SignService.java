package com.java.service;

import java.net.InetAddress;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.mapper.SignMapper;

@Service
public class SignService {

	@Autowired
	private SignMapper signMapper;
	
	/**
	 * 签到
	 * @param classid
	 * @param account
	 * @param localHost
	 * @return
	 */
	public Integer sign(Integer classid, Long account, InetAddress localHost) {
		// TODO Auto-generated method stub
		String host = localHost.toString();
		
		return signMapper.sign(classid, account,host,new Date());
	}

}

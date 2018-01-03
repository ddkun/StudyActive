package com.java.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.mapper.DiscussMapper;
import com.java.mapper.ReplyMapper;
import com.java.pojo.Discuss;
import com.java.pojo.Reply;

@Service
public class DiscussService {

	@Autowired
	private DiscussMapper discussMapper;
	
	@Autowired
	private ReplyMapper replyMapper;
	
	public Integer saveDiscuss(String discussTitle ,Integer did){
		// TODO Auto-generated method stub
		return discussMapper.saveDiscuss(discussTitle,did,new Date());
	}

	public List<Discuss> getDiscuss() {
		// TODO Auto-generated method stub
		return discussMapper.getDiscuss();
	}

	public Integer deleteDiscuss(Integer did) {
		// TODO Auto-generated method stub
		return discussMapper.deleteDiscuss(did);
	}

	public Discuss getDiscuss(Integer did) {
		// TODO Auto-generated method stub
		return discussMapper.findDiscuss(did);
	}

	public List<Reply> getReply(Integer did) {
		// TODO Auto-generated method stub
		return replyMapper.getReply(did);
	}

	public Integer saveReply(Integer did, String replyContent, Long account) {
		// TODO Auto-generated method stub
		return replyMapper.saveReply(did,replyContent,account,new Date());
	}

	public Integer deleteReply(Integer rid) {
		// TODO Auto-generated method stub
		return replyMapper.deleteReply(rid);
	}
}

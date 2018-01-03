package com.java.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.java.annotation.Responsity;
import com.java.pojo.Reply;

@Responsity
public interface ReplyMapper {

	List<Reply> getReply(Integer did);

	Integer saveReply(@Param("did")Integer did, @Param("replyContent")String replyContent, 
			@Param("account")Long account, @Param("date") Date date);

	Integer deleteReply(Integer rid);
   
}
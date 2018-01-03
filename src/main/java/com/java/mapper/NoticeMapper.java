package com.java.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.java.annotation.Responsity;
import com.java.pojo.Notice;

@Responsity
public interface NoticeMapper {
    /**
     * 用户自定义
     * @param classid
     * @return
     */
	List<Notice> getNotice();

	Integer getNoticeCount();

	String getNoticeInfo(Integer nid);

	void updateNoticePage(Integer nid);

	Integer deleteNotice(Integer nid);


	Integer saveNotice(@Param("noticeDesc")String noticeDesc, @Param("noticeContent")String noticeContent, @Param("date")Date date, @Param("status")Integer status);
}
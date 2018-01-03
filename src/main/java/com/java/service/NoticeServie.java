package com.java.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.mapper.NoticeMapper;
import com.java.pojo.Notice;

@Service
public class NoticeServie {

	@Autowired
	private NoticeMapper noticeMapper;

	/**
	 * 获取通知列表
	 * @return
	 */
	public List<Notice> getNotice() {
		return noticeMapper.getNotice();
	}
	
	/**
	 * 获取通知数目
	 * @return
	 */
	public Integer getNoticeCount(){
		return noticeMapper.getNoticeCount();
	}

	/**
	 * 获取通知详情
	 * @param nid
	 * @return
	 */
	public String getNoticeInfo(Integer nid) {
		// TODO Auto-generated method stub
		return noticeMapper.getNoticeInfo(nid);
	}

	/**
	 * 更新通知状态
	 * @param nid
	 */
	public void updateNoticePage(Integer nid) {
		// TODO Auto-generated method stub
		noticeMapper.updateNoticePage(nid);
	}

	/**
	 * 删除通知
	 * @param nid
	 * @return
	 */
	public Integer deleteNotice(Integer nid) {
		// TODO Auto-generated method stub
		return noticeMapper.deleteNotice(nid);
	}

	/**
	 * 发布通知
	 * @param notice
	 * @return
	 */
	public Integer saveNotice(Notice notice) {
		// TODO Auto-generated method stub
		return noticeMapper.saveNotice(notice.getNoticeDesc(),notice.getNoticeContent(),new Date(),notice.getStatus());
	}
}

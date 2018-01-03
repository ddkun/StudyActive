package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.pojo.Notice;
import com.java.service.NoticeServie;
import com.java.tools.Msg;
import com.java.tools.Tools;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeServie noticeServie;
	
	/**
	 * 获取通知列表
	 * @param role
	 * @param model
	 * @return
	 */
	@RequestMapping("/getNotice/{role}")
	public String getNotice(@PathVariable Integer role , Model model){
		List<Notice> list = noticeServie.getNotice();
		Integer count = noticeServie.getNoticeCount();
		model.addAttribute("notice_List", list);
		model.addAttribute("NoticeCount", count);
		return role==1?"student/notice":"teacher/notice";
	}
	
	/**
	 * 获取通知详情/内容
	 * @param nid
	 * @return
	 */
	@RequestMapping("/getNoticeInfo")
	@ResponseBody
	public Msg getNoticeInfo(@RequestParam("id")Integer nid){
		return new Msg().msg("NoticeInfo", noticeServie.getNoticeInfo(nid));
	}
	
	/**
	 * 更改通知状态（未读、已读）
	 * @param nid
	 * @return
	 */
	@RequestMapping("/updateNoticePage")
	@ResponseBody
	public Msg updateNoticePage(@RequestParam("id") Integer nid){
		noticeServie.updateNoticePage(nid);
		return new Msg().Success();
	}
	
	/**
	 * 删除通知
	 * @param nid
	 * @return
	 */
	@RequestMapping("/deleteNotice")
	@ResponseBody
	public Msg deleteNotice(@RequestParam("id") Integer nid){
		Integer i = noticeServie.deleteNotice(nid);
		return i>0?new Msg().Success(Tools.success):new Msg().Fail(Tools.fail);
	}
	
	/**
	 * 发布通知
	 * @param notice
	 * @return
	 */
	@RequestMapping("/saveNotice")
	@ResponseBody
	public Msg saveNotice(Notice notice){
		Integer i = noticeServie.saveNotice(notice);
		return i>0?new Msg().Success(Tools.success):new Msg().Fail(Tools.fail);
	}
	
}

package com.java.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.pojo.User;
import com.java.service.GroupService;
import com.java.tools.Msg;
import com.java.tools.Tools;

@Controller
@RequestMapping("/group")
public class GroupController {

	@Autowired
	private GroupService groupService;
	
	/**
	 * 获取小组列表
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/getGroup")
	public String getGroup(HttpSession session,Model model){
		User user = (User) session.getAttribute("username");
		model.addAttribute("groupInfo", groupService.getGroup(user.getAccount()));
		return "student/group";
	}
	
	/**
	 * 更改组名
	 * @param account
	 * @param name
	 * @return
	 */
	@RequestMapping("/updateName")
	@ResponseBody
	public Msg updateName(Long account,String name){
		Integer i = groupService.updateName(account,name);
		return i>0?new Msg().Success(Tools.success):new Msg().Fail(Tools.fail);
	}
	
}

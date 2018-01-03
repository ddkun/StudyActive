package com.java.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.pojo.User;
import com.java.service.PersonService;
import com.java.tools.Msg;
import com.java.tools.Tools;

@Controller
@RequestMapping("/person")
public class PersonController {

	@Autowired
	private PersonService personService;
	
	/**
	 * 更改个人信息
	 * @param user
	 * @param session
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	public Msg update(User user,HttpSession session){
		Integer i = personService.update(user);
		return i>0?new Msg().Success(Tools.success):new Msg().Fail(Tools.fail);
	}
	
	/**
	 * 获取用户个人信息
	 * @param session
	 * @return
	 */
	@RequestMapping("/person")
	public String person(HttpSession session){
		if(session.getAttribute("username")==null){
			return "login";
		}
		return "person";
	}
}

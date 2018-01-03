package com.java.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.pojo.User;
import com.java.service.UserService;
import com.java.tools.Tools;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private UserService userService;

	/**
	 * 页面跳转
	 * @param request
	 * @return
	 */
	@RequestMapping("/toLogin")
	public String toLogin(HttpServletRequest request) {
		request.getSession().removeAttribute("username");
		request.getSession().invalidate();
		return "login";
	}
	
	/**
	 * 用户登录
	 * @param user
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/login")
	public String login(User user,HttpServletRequest request,Model model) {
		User u = userService.findAccount(user);
		if(u!=null){
			request.getSession().setAttribute("username", u);
			if(u.getRole()==1){
				return "student/main";
			}else{
				return u.getRole()==2?"teacher/main":"admin/main";
			}
		}else{
			model.addAttribute("tip", Tools.logintip);
			return "login";
		}
	}
}

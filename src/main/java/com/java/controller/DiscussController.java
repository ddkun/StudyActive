package com.java.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.pojo.Discuss;
import com.java.pojo.Reply;
import com.java.pojo.User;
import com.java.service.DiscussService;
import com.java.tools.Msg;
import com.java.tools.Tools;

@Controller
@RequestMapping("/discuss")
public class DiscussController {

	@Autowired
	private DiscussService discussService;
	
	@RequestMapping("/saveDiscuss")
	@ResponseBody
	public Msg saveDiscuss(String discussTitle ,Integer did){
		Integer i = discussService.saveDiscuss(discussTitle,did);
		return i>0?new Msg().Success(Tools.success):new Msg().Fail(Tools.fail);
	}
	
	@RequestMapping("/getDiscuss")
	public String getDiscuss(Model model){
		List<Discuss> list= discussService.getDiscuss();
		model.addAttribute("discussList", list);
		return "discuss";
	}
	
	@RequestMapping("/deleteDiscuss")
	public String deleteDiscuss(@RequestParam Integer did , Model model){
		Integer i = discussService.deleteDiscuss(did);
		return i>0?"redirect:getDiscuss":"redirect:getDiscuss";
	}
	
	@RequestMapping("/goDiscuss")
	public String goDiscuss(@RequestParam Integer did , Model model){
		Discuss discuss = discussService.getDiscuss(did);
		List<Reply> list = discussService.getReply(did);
		model.addAttribute("discussInfo", discuss);
		model.addAttribute("replyList", list);
		return "discussInfo";
	}
	
	@RequestMapping("/saveReply")
	@ResponseBody
	public Msg saveReply(@RequestParam Integer did ,@RequestParam String replyContent , HttpSession session,Model model){
		User user =(User)session.getAttribute("username");
		Integer i= discussService.saveReply(did,replyContent,user.getAccount());
		return i>0?new Msg().Success(Tools.success):new Msg().Fail(Tools.fail);
	}
	
	@RequestMapping("/deleteReply")
	@ResponseBody
	public Msg deleteReply(@RequestParam Integer rid){
		Integer i= discussService.deleteReply(rid);
		return i>0?new Msg().Success(Tools.success):new Msg().Fail(Tools.fail);
	}
}

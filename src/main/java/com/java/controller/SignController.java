package com.java.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.service.SignService;
import com.java.tools.Msg;
import com.java.tools.Tools;

@Controller
@RequestMapping("/sign")
public class SignController {

	@Autowired
	private SignService signService;
	
	/**
	 * 学生签到
	 * @param classid
	 * @param account
	 * @return
	 * @throws UnknownHostException
	 */
	@RequestMapping("/sign/{classid}/{account}")
	@ResponseBody
	public Msg sign(@PathVariable Integer classid,@PathVariable Long account) throws UnknownHostException{
		Integer i = signService.sign(classid,account,InetAddress.getLocalHost());
		return i>0?new Msg().Success(Tools.signSuccess):new Msg().Fail(Tools.signFail);
	}
	
	/**
	 * 开启/关闭签到功能
	 * @param session
	 * @param flag
	 * @return
	 */
	@RequestMapping("/opensign/{flag}")
	@ResponseBody
	public Msg opensign(HttpSession session,@PathVariable String flag) {
		if(flag.equals("open")){
			session.setAttribute("signStatus", "true");
			return new Msg().Success(Tools.opensign);
		}else{
			session.setAttribute("signStatus", "false");
			return new Msg().Success(Tools.closesign);
		}
	}
}

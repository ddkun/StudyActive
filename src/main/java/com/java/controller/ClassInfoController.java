package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.pojo.ClassInfo;
import com.java.service.ClassInfoService;

@Controller
@RequestMapping("/classInfo")
public class ClassInfoController {

	@Autowired
	private ClassInfoService classInfoService;
	
	/**
	 * 学生进入课程的章节页面
	 * @param classid
	 * @param model
	 * @return
	 */
	@RequestMapping("/getClassInfo")
	public String getClassInfo(@RequestParam("classId") Integer classid , Model model){
		List<ClassInfo> list = classInfoService.getClassInfo(classid);
		model.addAttribute("classinfoList", list);
		return "student/theLesson";
	}
	
	/**
	 * 学生进入课程的章节页面，进行上课操作
	 * @param classid
	 * @param model
	 * @return
	 */
	@RequestMapping("/goClassInfo")
	public String goClassInfo(@RequestParam("ciid") Integer ciid,@RequestParam("classId") Integer classid ){
		classInfoService.goClassInfo(ciid);
		return "redirect:getClassInfo?classId="+classid;
	}
	
	
	/**
	 * 老师进入课程的章节页面
	 * @param classid
	 * @param model
	 * @return
	 */
	@RequestMapping("/GOClass")
	public String GOClass(@RequestParam("classId") Integer classid , Model model){
		List<ClassInfo> list = classInfoService.getClassInfo(classid);
		model.addAttribute("classinfoList", list);
		return "teacher/theLesson";
	}
	
	/**
	 * 老师进入课程的章节页面，进行讲课操作
	 * @param classid
	 * @param model
	 * @return
	 */
	@RequestMapping("/openClassInfo")
	public String openClassInfo(@RequestParam("ciid") Integer ciid,@RequestParam("classId") Integer classid ){
		classInfoService.goClassInfo(ciid);
		return "redirect:GOClass?classId="+classid;
	}
	
}

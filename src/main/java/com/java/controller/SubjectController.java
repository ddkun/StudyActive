package com.java.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.pojo.StudentToSubject;
import com.java.pojo.Subject;
import com.java.pojo.User;
import com.java.service.StudentToSubjectService;
import com.java.service.SubjectService;

@Controller
@RequestMapping("/subject")
public class SubjectController {

	@Autowired
	private StudentToSubjectService studentToSubjectService;
	
	@Autowired
	private SubjectService subjectService;
	
	/**
	 * 获取学生课程，以及上课的数目
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/getSubject")
	public String getSubject(HttpSession session,Model model){
		User user = (User) session.getAttribute("username");
		List<StudentToSubject> list = studentToSubjectService.getSubject(user.getAccount());
		model.addAttribute("SubjectCount", studentToSubjectService.getSubjectCount(user.getAccount()));
		model.addAttribute("subjectList", list);
		return "student/classroom";
	}
	
	/**
	 * 获取老师的课程，以及课程数目
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/teacherSubject")
	public String teacherSubject(HttpSession session,Model model){
		User user = (User) session.getAttribute("username");
		List<Subject> list = subjectService.getSubject(user.getAccount());
		model.addAttribute("TeacherSubjectCount", subjectService.getSubjectCount(user.getAccount()));
		model.addAttribute("TeachersubjectList", list);
		return "teacher/classroom";
	}
	
	/**
	 * 老师进行开课操作
	 * @param cid
	 * @return
	 */
	@RequestMapping("/openSubject")
	public String openSubject(@RequestParam("cid") Integer cid){
		Integer i = subjectService.openClass(cid);
		return i>0?"redirect:teacherSubject":"redirect:teacherSubject";
	}
	
	/**
	 * 老师进行结课操作
	 * @param cid
	 * @return
	 */
	@RequestMapping("/closeSubject")
	public String closeSubject(@RequestParam("classId") Integer classid){
		Integer i = subjectService.closeSubject(classid);
		return i>0?"redirect:teacherSubject":"redirect:teacherSubject";
	}
}

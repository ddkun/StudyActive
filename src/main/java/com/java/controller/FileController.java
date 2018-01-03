package com.java.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.java.service.FileService;

@Controller
@RequestMapping("/file")
public class FileController {

	@Autowired
	private FileService fileService;
	
	@RequestMapping("/resource")
	public String resource(Model model){
		List<File> list = fileService.select();
		model.addAttribute("fileList",list);
		return "resource";
	}

	@RequestMapping("/upload")
	public ModelAndView upload(@RequestParam("myfile") MultipartFile file,HttpServletRequest request) throws Exception{
		if(!file.isEmpty()){
			File f = new File(request.getServletContext().getRealPath("file"),file.getOriginalFilename());
			if(!f.exists()){
				f.mkdirs();
			}
			file.transferTo(f);
			String path =file.getOriginalFilename();
			fileService.insert(path,(double)file.getSize()/1024);
		}
		return new ModelAndView(new RedirectView("resource"));
	}
	
	@SuppressWarnings("resource")
	@RequestMapping("/download")
	public void download(String file,
			HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		String fileName = new String(file.getBytes("ISO8859-1"),"utf-8");
		String files = request.getSession().getServletContext().getRealPath("file")+"/"+fileName;
		InputStream bis = new BufferedInputStream(new FileInputStream(new File(files)));
		response.addHeader("Content-Disposition", "attachment;filename="+new Random().nextInt(1000)+fileName.substring(fileName.lastIndexOf(".")));
		response.setContentType("multipart/form-data");
		BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
		int len = 0;
		while((len=bis.read())!=-1){
			out.write(len);
			out.flush();
		}
		out.close();
	}
}

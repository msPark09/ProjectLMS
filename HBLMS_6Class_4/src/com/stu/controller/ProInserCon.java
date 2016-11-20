package com.stu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.dao.DetailDao;
import com.lms.dao.InsertDao;
import com.lms.dto.ProjectDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProInserCon extends HttpServlet {
	
	private InsertDao dao;
	private ProjectDto dto;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String path=request.getRealPath("file");
		System.out.println(path);
		MultipartRequest mr=null;
		int fsize=1024*1024*2;
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
		mr=new MultipartRequest(request, path, fsize, "utf-8", policy);

		String proid = mr.getParameter("proid");
		String lectid = mr.getParameter("lectid");
		String proname = "임시강의";
		String subname = mr.getParameter("subname");
		String proexp = mr.getParameter("proexp");
		String proorin=mr.getOriginalFileName("proorin");
		String proren=mr.getFilesystemName("proorin");
		String id = mr.getParameter("stuid");
		
		dto = new ProjectDto();
		dto.setProid(proid);
		dto.setLectid(lectid);
		dto.setProname(proname);
		dto.setSubname(subname);
		dto.setProexp(proexp);
		dto.setProorin(proorin);
		dto.setProren(proren);
		dto.setId(id);
		
		dao = new InsertDao();
		dao.ProjectInsert(dto);
		
		response.sendRedirect("List.do?id="+id+"&lectid="+lectid);
				
	}
	
}

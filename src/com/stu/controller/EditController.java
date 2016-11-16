package com.stu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.dao.DetailDao;
import com.lms.dto.ProjectDto;

public class EditController extends HttpServlet {

	private DetailDao dao;
	private ProjectDto dto;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String proid = request.getParameter("proid");
		String stuid = request.getParameter("stuid");
//		String path=request.getRealPath("file");
		
//		System.out.println(proid);
//		System.out.println(stuid);
		
		dao = new DetailDao();
		dto = dao.StuProDetail(proid,stuid);
		request.setAttribute("bean", dto);
		
		request.getRequestDispatcher("Student/ResultsEdit.jsp").forward(request, response);
	}

}

package com.stu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.lms.dao.DetailDao;
import com.lms.dto.ProjectDto;

public class ProDetailCon extends HttpServlet {

	private DetailDao dao;
	private ProjectDto dto;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String proid = request.getParameter("proid");
		String stuid = request.getParameter("stuid");
		String lectid = request.getParameter("lectid");
//		String path=request.getRealPath("file");
		
		dao = new DetailDao();
		dto = dao.StuProDetail(proid,stuid);
		if(!(dto==null || "".equals(dto))){
			request.setAttribute("bean", dto);
	//		request.setAttribute("udir", path);
			request.getRequestDispatcher("Student/ResultsContent.jsp").forward(request, response);
		}else{
			JOptionPane.showMessageDialog(null, "제출한과제가 없습니다.", "에러", JOptionPane.ERROR_MESSAGE);
			response.sendRedirect("List.do?lectid="+lectid+"&id="+stuid);
		}
	}

}

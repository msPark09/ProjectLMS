package com.stu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.lms.dao.DetailDao;
import com.lms.dto.ProjectDto;

public class AddController extends HttpServlet {

	private DetailDao dao;
	private ProjectDto dto;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String proid = request.getParameter("proid");
		String stuid = request.getParameter("stuid");
		String lect = request.getParameter("lect");
		String lectid = request.getParameter("lectid");
		
		dao = new DetailDao();
		dto = dao.StuProDetail(proid,stuid);
		if(dto==null || "".equals(dto)){
			request.setAttribute("proid", proid);
			request.setAttribute("stuid", stuid);
			request.setAttribute("lect", lect);
			request.setAttribute("lectid", lectid);
			request.getRequestDispatcher("Student/ResultsInsert.jsp").forward(request, response);
		}else{
			JOptionPane.showMessageDialog(null, "�̹� ������ �����ϼ̽��ϴ�.", "����", JOptionPane.ERROR_MESSAGE);
			response.sendRedirect("List.do?lectid="+lectid+"&id="+stuid);
		}
	}

}
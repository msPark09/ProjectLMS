package com.lect.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.lms.dao.SelectAllDao;
import com.lms.dto.ProjectDto;
import com.lms.dto.ProlistDto;

public class StuLectListCon extends HttpServlet {
	
	private SelectAllDao dao;
	private List<ProlistDto> list;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		
		dao = new SelectAllDao();
		list = dao.StuLectList(id);
		
		request.setAttribute("id", id);
		request.setAttribute("stlist", list);
		request.getRequestDispatcher("Student/ResultsLect.jsp").forward(request, response);
		
	}

}

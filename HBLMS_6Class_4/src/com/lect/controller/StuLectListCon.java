package com.lect.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.lms.dao.SelectAllDao;
import com.lms.dto.LectureDto;
import com.lms.dto.ProjectDto;
import com.lms.dto.ProlistDto;

public class StuLectListCon extends HttpServlet {
	
	private SelectAllDao dao;
	private List<LectureDto> list;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		
		dao = new SelectAllDao();
		list = new ArrayList<LectureDto>();
		try {
			list = dao.StuLectList(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String empty="";
		if(list.size()==0){
			empty += "수강중인 강의가 없습니다.";
		}
		request.setAttribute("emptyList", empty);
		request.setAttribute("id", id);
		request.setAttribute("stlist", list);
		request.getRequestDispatcher("Student/ResultsLect.jsp").forward(request, response);
		
	}

}

package com.stu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.lms.dao.SearchDao;
import com.lms.dto.ProlistDto;


public class LectOneController extends HttpServlet {
	
	private List<ProlistDto> list;
	private SearchDao dao;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String sel = request.getParameter("sel");
		int op = Integer.parseInt(request.getParameter("op"));
		
		dao = new SearchDao();
		try {
			list = dao.StuLectOne(id,sel,op);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(list.size()>0){
			request.setAttribute("id", id);
			request.setAttribute("slist", list);
			request.getRequestDispatcher("Student/ResultsLect.jsp").forward(request, response);
		}else{
			JOptionPane.showMessageDialog(null, "등록된 강의가 없습니다.", "메세지", JOptionPane.ERROR_MESSAGE);
			response.sendRedirect("lectlist.do");
		}
	}
	
	
}

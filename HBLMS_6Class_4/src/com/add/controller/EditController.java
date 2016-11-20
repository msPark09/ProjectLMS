package com.add.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.dao.SelectAllDao;
import com.lms.dao.UpdateDao;
import com.lms.dto.LectureDto;

public class EditController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String sKeyname; 
		int priority;
		List<LectureDto> list = new ArrayList<LectureDto>();
		try {
			SelectAllDao dao = new SelectAllDao();
			list = dao.Todo();
			
			for(int i=0; i<list.size();i++){
				sKeyname = list.get(i).getClassid();
				priority = Integer.parseInt(request.getParameter(sKeyname).trim()); 
				
				System.out.println(priority);
				System.out.println(sKeyname);
				UpdateDao dao2 = new UpdateDao();
				dao2.updatePriority(sKeyname, priority);
			}
			
		} catch (Exception e) {
				
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("priolist");
		rd.forward(request, response);
		
		
		
	}
//	protected void dopost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		try {
//			TodoDao dao = new TodoDao();
//			dao.Todo();
//		} catch (Exception e) {
//				
//			e.printStackTrace();
//		}
//		
//		RequestDispatcher rd = request.getRequestDispatcher("/main.jsp");
//		rd.forward(request, response);
//		
//		
//		
//	}
}


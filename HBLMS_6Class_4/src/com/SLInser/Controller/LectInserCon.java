package com.SLInser.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.dao.InsertDao;

public class LectInserCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//String name; 
//		int priority;
			int result=0;	
			String classid = request.getParameter("classid");
			String id = request.getParameter("id");
		try {
			//UnoDao dao = new UnoDao();
			InsertDao dao = new InsertDao();
			result = dao.LectInser(id,classid);
			//List<UnoDto> list = dao.();
			
		//	for(int i=0; i<list.size();i++){
				//sKeyname = list.get(i).get();
//				name = list.get(0).getName();
//			//priority = Integer.parseInt(request.getParameter(sKeyname)); 
//				
//				//System.out.println(priority);
//				System.out.println(name);
//				//System.out.println(sKeyname);
//				UnoDao dao2 = new UnoDao();
//				//dao2.updatePriority(sKeyname, priority);
//				dao2.updatePriority(name);
		//	}
			
		} catch (Exception e) {
				
			e.printStackTrace();
		}
		if(result>0){
		//RequestDispatcher rd = request.getRequestDispatcher("/.jsp");
		//rd.forward(request, response);
			response.sendRedirect("lecintro");
		}else{
			System.out.println("입력실패");
			response.sendRedirect("error.jsp");
		}
		
		
	}
}
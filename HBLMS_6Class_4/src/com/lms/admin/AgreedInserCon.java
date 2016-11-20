package com.lms.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.dao.InsertDao;


public class AgreedInserCon extends HttpServlet {
	
	private InsertDao dao;
	private int result =0;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String lectid = request.getParameter("lectid");
		String stuid = request.getParameter("stuid");
		dao = new InsertDao();
		try {
			result = dao.AgreedInser(lectid, stuid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0){
			response.sendRedirect("./agreedlist");
		}else{
			response.sendRedirect("./../error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

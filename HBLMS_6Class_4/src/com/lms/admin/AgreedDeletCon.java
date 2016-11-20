package com.lms.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.dao.DeleteDao;


public class AgreedDeletCon extends HttpServlet {

	private int result;
	private DeleteDao dao;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String stuid = request.getParameter("stuid");
		String lectid = request.getParameter("lectid");
		dao = new DeleteDao();
		try {
			result = dao.AgreedDelete(stuid, lectid);
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

}

package com.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.dao.SelectAllDao;


public class IdCheckController extends HttpServlet {

	private SelectAllDao dao;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("ID");
		
		dao = new SelectAllDao();
		int count = dao.IdCheck(id);
		
		request.setAttribute("id", id);
		request.setAttribute("count", count);
		request.getRequestDispatcher("login/idcheck.jsp").forward(request, response);
		
	}

}

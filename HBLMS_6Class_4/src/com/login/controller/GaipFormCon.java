package com.login.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GaipFormCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<String> list = new ArrayList<String>();
		
		list.add("강사채용");
		list.add("교육센터위치");
		
		request.setAttribute("menu", list);
		request.setAttribute("title", "회원가입");
		request.getRequestDispatcher("login/gaip.jsp").forward(request, response);
	}

}

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
		
		list.add("����ä��");
		list.add("����������ġ");
		
		request.setAttribute("menu", list);
		request.setAttribute("title", "ȸ������");
		request.getRequestDispatcher("login/gaip.jsp").forward(request, response);
	}

}

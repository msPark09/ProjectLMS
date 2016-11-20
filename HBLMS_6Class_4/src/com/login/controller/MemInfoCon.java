package com.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lms.dao.DetailDao;
import com.lms.dto.MemDto;

public class MemInfoCon extends HttpServlet {

	private DetailDao dao;
	private MemDto dto;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		dao = new DetailDao();
		try {
			dto = dao.MemberOne(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String[] phone = dto.getPhone().split("-");
		String[] address = dto.getAddress().split("#");
		String[] mail = dto.getMail().split("@");
		request.setAttribute("bean", dto);
		request.setAttribute("phone", phone);
		request.setAttribute("address", address);
		request.setAttribute("mail", mail);
		request.getRequestDispatcher("userUpdate.jsp").forward(request, response);

	
	}

}

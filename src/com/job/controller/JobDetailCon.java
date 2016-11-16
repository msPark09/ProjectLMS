package com.job.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.dao.DetailDao;
import com.lms.dto.JoblistDto;


public class JobDetailCon extends HttpServlet {

	private DetailDao dao;
	private JoblistDto dto;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		dto = new JoblistDto();
		dao = new DetailDao();
		
		try {
			dto = dao.JobDetail(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("./jobdetail.jsp").forward(request, response);	
		
	}
	
}

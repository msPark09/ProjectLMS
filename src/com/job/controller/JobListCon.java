package com.job.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.dao.SelectAllDao;
import com.lms.dto.JoblistDto;



public class JobListCon extends HttpServlet {
	private List<JoblistDto> list;
	private SelectAllDao dao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		dao = new SelectAllDao();
		 list = new ArrayList<JoblistDto>();
		try {
			list = dao.JobList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("list", list);
		request.getRequestDispatcher("./joblist.jsp").forward(request, response);
	}

}

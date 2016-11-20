package com.main.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.dao.SelectAllDao;
import com.lms.dto.LectureDto;


@WebServlet("/prioEdit")
public class PriorityEdit extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		SelectAllDao dao = new SelectAllDao();
		List<LectureDto> list = new ArrayList<LectureDto>();

		try {
			list = dao.Todo();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("list", list);
		request.getRequestDispatcher("edit_form.jsp").forward(request, response);
	}

}

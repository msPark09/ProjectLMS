package com.lms.teacher;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.dao.DetailDao;
import com.lms.dto.ProjectDto;

public class TestDetailPage extends HttpServlet{
	private List<ProjectDto> list;
	private DetailDao dao;
	private String id;
	private String proid;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		id = request.getParameter("id");
		proid = request.getParameter("proid");
		System.out.println("id : "+id+ " proid : "+proid);

		list = new ArrayList<ProjectDto>();
		dao = new DetailDao();
		try {
			list = dao.TeaProDetail(proid,id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("prodetaillist", list);
		request.setAttribute("proid", proid);
		System.out.println(proid);
		request.getRequestDispatcher("testinser.jsp").forward(request,
				response);
	}
	
}

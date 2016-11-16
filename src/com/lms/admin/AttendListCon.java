package com.lms.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.dao.SelectAllDao;
import com.lms.dto.SuupDto;

public class AttendListCon extends HttpServlet {

	private SelectAllDao dao;
	private List<SuupDto> list;
	private int totalDay;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		dao = new SelectAllDao();
		String lectid = request.getParameter("lectid");
		lectid = lectid.trim();
		totalDay = 0;
		try {
			list = dao.attendList(lectid);
			if (list.size() > 0) {
				totalDay = list.get(0).getTotalDay();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("lectid", lectid);
		request.setAttribute("alist", list);
		request.setAttribute("totalDay", totalDay);

		request.getRequestDispatcher("./AttendList.jsp").forward(request,
				response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

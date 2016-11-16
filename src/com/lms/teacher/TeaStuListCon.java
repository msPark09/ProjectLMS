package com.lms.teacher;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.dao.SelectAllDao;
import com.lms.dto.SuupDto;

public class TeaStuListCon extends HttpServlet{
	private List<SuupDto> list;
	private SelectAllDao dao = null;
	private String classid;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		classid = req.getParameter("classid");
		dao = new SelectAllDao();
		try {
			list=dao.TeaStuList(classid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		req.setAttribute("teastulist", list);
		req.setAttribute("classid", classid);
		req.getRequestDispatcher("teastulist.jsp").forward(req, resp);
	}
	

}

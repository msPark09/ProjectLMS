package com.lms.teacher;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.dao.SelectAllDao;
import com.lms.dto.ProjectDto;

public class LectProidListCon extends HttpServlet{
	private List<ProjectDto> lectprolist;
	private SelectAllDao dao = null;
	private String proid;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		proid = req.getParameter("proid");
		dao = new SelectAllDao();
		try {
			lectprolist=dao.LectproList(proid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		req.setAttribute("lectprolist", lectprolist);
		req.setAttribute("proid", proid);
		req.getRequestDispatcher("lectprolist.jsp").forward(req, resp);
	}

}

package com.lms.teacher;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.dao.SelectAllDao;
import com.lms.dto.ProlistDto;

public class ProListCon extends HttpServlet{
	private List<ProlistDto> prolist;
	private SelectAllDao dao = null;
	private String classid;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		classid =req.getParameter("classid");
		System.out.println(classid);
		dao = new SelectAllDao();
		prolist = new ArrayList<ProlistDto>();
		try {
			prolist=dao.TeaProjectList(classid);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		req.setAttribute("prolist", prolist);
		req.setAttribute("classid", classid);
		req.getRequestDispatcher("prolist.jsp").forward(req,resp);
		
	}

}

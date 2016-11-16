package com.lms.teacher;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.dao.InsertDao;

public class TestInserCon extends HttpServlet {
	private int result = 0;
	private InsertDao dao;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			String id = req.getParameter("id");
			String grade = req.getParameter("grade");
			String proid = req.getParameter("proid");
			System.out.println(proid);
			int gradeInt = 0;
			if(grade!= null || !grade.equals("")){
				gradeInt = Integer.parseInt(grade);
			}
			String testid = req.getParameter("testid");
			dao = new InsertDao();
			try {
				result = dao.ScoreInser(id, gradeInt,testid);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(result>0){
				resp.sendRedirect("./lectprolist?proid="+proid);
			}else{
				resp.sendRedirect("./detailinsert?id="+id+"&proid="+proid);
			}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	
	}

}

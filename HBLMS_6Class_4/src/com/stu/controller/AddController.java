package com.stu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.lms.dao.DetailDao;
import com.lms.dto.ProjectDto;

public class AddController extends HttpServlet {

	private DetailDao dao;
	private ProjectDto dto;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String proid = request.getParameter("proid");
		String stuid = request.getParameter("stuid");
		String lect = request.getParameter("lect");
		String lectid = request.getParameter("lectid");
		
		dao = new DetailDao();
		try {
			dto = dao.StuProDetail(proid,stuid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String data = "";
		if(dto==null || "".equals(dto)){
			request.setAttribute("proid", proid);
			request.setAttribute("stuid", stuid);
			request.setAttribute("lect", lect);
			request.setAttribute("lectid", lectid);
			request.getRequestDispatcher("Student/ResultsInsert.jsp").forward(request, response);
		}else{
//			JOptionPane.showMessageDialog(null, "이미 과제를 제출하셨습니다.", "에러", JOptionPane.ERROR_MESSAGE);
//			response.sendRedirect("List.do?lectid="+lectid+"&id="+stuid);
			data += "<script type=\"text/javascript\"> alert(\"이미 과제를 제출하셨습니다.\"); location.href=\"List.do?lectid="+lectid+"&id="+stuid+"\"; </script>";
			response.setCharacterEncoding("UTF-8");
			PrintWriter print = response.getWriter();
			print.print(data);
		}
	}

}

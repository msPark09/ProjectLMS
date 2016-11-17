package com.lect.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.lms.dao.SearchDao;
import com.lms.dao.SelectAllDao;
import com.lms.dto.ProlistDto;

public class ProListCon extends HttpServlet {
	
	private SelectAllDao dao=null;
	private List<ProlistDto> list;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String lectid = request.getParameter("lectid");
		String id = request.getParameter("id");
				
		dao = new SelectAllDao();
		list = dao.StuProjectList(lectid,id);
		String data = "";
		if(list.size()>0){
			request.setAttribute("lectid", lectid);
			request.setAttribute("id", id);
			request.setAttribute("alist", list);
			request.getRequestDispatcher("Student/ResultsList.jsp").forward(request, response);
		}else{
//			JOptionPane.showMessageDialog(null, "등록된 프로젝트가 없습니다.", "메세지", JOptionPane.ERROR_MESSAGE);
//			response.sendRedirect("lectlist.do");
			data += "<script type=\"text/javascript\"> alert(\"등록된 프로젝트가 없습니다.\"); location.href=\"lectlist.do\"; </script>";
			response.setCharacterEncoding("UTF-8");
			PrintWriter print = response.getWriter();
//			String dataEnco = URLEncoder.encode(data, "UTF-8");
			print.print(data);
		}
	}

}

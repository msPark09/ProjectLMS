package com.stu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.lms.dao.SearchDao;
import com.lms.dto.ProlistDto;

public class OneController extends HttpServlet {

	private SearchDao dao;
	private List<ProlistDto> list;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String lectid = request.getParameter("lectid");
		String id = request.getParameter("id");
		String sel = request.getParameter("sel");
		int op = Integer.parseInt(request.getParameter("op"));	
		
		System.out.println(lectid);
		System.out.println(id);
		System.out.println(sel);
		System.out.println(op);
		
		dao = new SearchDao();
		list = dao.ProListOne(lectid,id,sel,op);
		
		if(list.size()>0){
			request.setAttribute("lectid", lectid);
			request.setAttribute("id", id);
			request.setAttribute("alist", list);
			request.getRequestDispatcher("Student/ResultsList.jsp").forward(request, response);
		}else{
			JOptionPane.showMessageDialog(null, "등록된 프로젝트가 없습니다.", "메세지", JOptionPane.ERROR_MESSAGE);
			request.setAttribute("lectid", lectid);
			request.setAttribute("id", id);
			request.setAttribute("alist", list);
			request.getRequestDispatcher("/List.do").forward(request, response);;
		}
		
//		
//		PrintWriter print = response.getWriter();
//		String data ="";
//		for(LectureDto bean:list){
//			data += "<tr>"+
//						"<td>"+bean.getLect()+"</td>"+
//						"<td><a href=\"content.do?proid="+bean.getProid()+"&stuid="+bean.getStuid()+"&lectid="+bean.getLectid()+"\">"+bean.getProname()+"</a></td>"+
//						"<td>"+bean.getProcont()+"</td>"+
//						"<td>"+bean.getProday()+"</td>"+
//						"<td>"+bean.getName()+"</td>"+
//						"<td>"+bean.getId()+"</td>"+
//						"<td><a href=\"add.do?proid="+bean.getProid()+"&stuid="+bean.getStuid()+"&lectid="+bean.getLectid()+"&lect="+bean.getLect()+"\">제출</a></td>"+
//					"</tr>";
//		}
//		
//		System.out.println(data);
//		String dataEnco = URLEncoder.encode(data,"UTF-8");
//		print.print(dataEnco);
//		response.setContentType("text/html;charset=UTF-8");
		
	}
	

}

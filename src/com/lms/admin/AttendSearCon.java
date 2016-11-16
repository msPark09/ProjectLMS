package com.lms.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.dao.SearchDao;
import com.lms.dto.SuupDto;

public class AttendSearCon extends HttpServlet {

	private SearchDao dao;
	private List<SuupDto> list;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		list= new ArrayList<SuupDto>();
		String op = request.getParameter("op");// 50% : 0,이름 :1
		String sel = request.getParameter("sel");// 검색어
		String lectid = request.getParameter("lectid");
		int totalday = Integer.parseInt(request.getParameter("totalday"));
		dao = new SearchDao();
		try {
			if (!op.equals("0")) {
				list = dao.attendListOne(sel, lectid);
			} else {
				list = dao.HalfAttendList(lectid, totalday);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String data = "";
		if (list.size() > 0) {
			totalday *=2;
			for (SuupDto bean : list) {
				int ratioday = bean.getAttday()*10000/totalday;
				data += "<tr\tclass=\"bean\">" 
						+ "<td>" +bean.getName()+ "</td>" 
						+ "<td>" +bean.getAttday()+"/"+totalday+"</td>" 
						+ "<td>" +ratioday/100.0+ "%</td>" 
						+ "<td><a\thref=\"tel:"+bean.getPh()+"\">"
						+bean.getPh()+ "</a></td>" 
						+ "</tr>";
			}
		}else{
			data = "<tr><td\tcolspan=\"4\">검색&nbsp;결과&nbsp;학생이&nbsp;없습니다.</td></tr>";			
		}
		System.out.println(data);

		PrintWriter print = response.getWriter();
		String dataEnco = URLEncoder.encode(data, "UTF-8");
		print.print(dataEnco);
		response.setContentType("text/html;charset=UTF-8");

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

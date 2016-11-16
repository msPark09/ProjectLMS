package com.lms.teacher;

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
import com.lms.dto.ProlistDto;

public class TeaProSearCon extends HttpServlet {
	
	private SearchDao dao;
	private List<ProlistDto> list;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String op = request.getParameter("op").trim();
		String sel = request.getParameter("sel").trim();
		String classid = request.getParameter("classid").trim();
		System.out.println("op : "+op+" sel : "+sel+" classid : "+classid);
		// String id = request.getSession()("id")//강사 로그인경우 session으로 변경 예정
		dao = new SearchDao();
		list = new ArrayList<ProlistDto>();
		// list = dao.searLectOneTea(id,op,sel);
		try {
			list = dao.searProjectTea(op, sel, classid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String data = "";
		int cnt=0;
		if (list.size() > 0) {
			for (ProlistDto bean : list) {
				data += "<tr class=\"bean\">"
						+"<td>"+(++cnt)+"</td>"
						+ "<td><a href=\"./lectprolist?proid="+bean.getProid()+"\">"+bean.getProname()+"</td>"
						+ "<td>"+bean.getProday()+"</td></tr>";
			}
		} else {
			data = "<tr><td colspan=\"3\">검색 결과가 없습니다.</td></tr>";
		}
		PrintWriter print = response.getWriter();
		data = URLEncoder.encode(data, "UTF-8");
		print.print(data);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

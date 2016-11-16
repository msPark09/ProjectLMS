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
import com.lms.dto.SuupDto;


public class TeaSutSearCon extends HttpServlet {
	
	private List<SuupDto> list;
	private SearchDao dao;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String op = request.getParameter("op").trim();
		String sel = request.getParameter("sel").trim();
		String classid = request.getParameter("classid").trim();
		System.out.println("op : "+op+" sel : "+sel+" classid : "+classid);
		// String id = request.getSession()("id")//���� �α��ΰ�� session���� ���� ����
		dao = new SearchDao();
		list = new ArrayList<SuupDto>();
		// list = dao.searLectOneTea(id,op,sel);
		try {
			list = dao.searStuOneTea(op, sel, classid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String data = "";
		int cnt=0;
		if (list.size() > 0) {
			for (SuupDto bean : list) {
				
				data += "<tr class=\"bean\">"
						+"<td>"+(++cnt)+"</td>"
						+ "<td>"+bean.getName()+"</td>"
						+ "<td><a href=\"tel:" + bean.getPh()
						+ "\">"+bean.getPh()+"</a></td></tr>";
			}
		} else {
			data = "<tr><td colspan=\"3\">�˻� ����� �����ϴ�.</td></tr>";
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

package com.main.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.dao.SearchDao;
import com.lms.dto.AgreedDto;
import com.lms.dto.MemDto;

public class MemSearCon extends HttpServlet {

	private SearchDao dao;
	private List<MemDto> list;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		dao = new SearchDao();
		String op = request.getParameter("op");
		String sel = request.getParameter("sel");
		try {
			list = dao.searMemList(op, sel);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*
		 * <th>번호</th> <th>아이디</th> <th>이름</th> <th>구분</th> <th>EMAIL</th>
		 * <th>전화번호</th>
		 */
		String data = "";
		int cnt=0;
		if (list.size() == 0) {
			data += "<tr><td\tcolspan=\"6\">검색 결과가 없습니다.</td></tr>";
		} else {
			for (MemDto bean : list) {
				data += "<tr\tclass=\"bean\"><td>" + (++cnt) + "</td><td>" + bean.getId() + "</td><td>" + bean.getName() + "</td>";
				if (bean.getLv() == 1)
					data += "<td>학생</td>";
				else if(bean.getLv() == 2)
					data += "<td>강사</td>";
				else if(bean.getLv() == 3)
					data += "<td>영업팀</td>";
				else if(bean.getLv() == 4)
					data += "<td>행정팀</td>";
				else
					data += "<td>회원</td>";
				data += "<td>"+bean.getMail()+"</td>";
				data += "<td><a href=\"tel:"+bean.getPhone()+"\">"+bean.getPhone()+"</a></td>";
				data += "</tr>";
			}
		}

		PrintWriter print = response.getWriter();
		data = URLEncoder.encode(data, "UTF-8");
		print.print(data);

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

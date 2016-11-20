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
import com.lms.dto.AgreedDto;

public class AgreedSearCon extends HttpServlet {

	private List<AgreedDto> list;
	private SearchDao dao;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		dao = new SearchDao();
		list = new ArrayList<AgreedDto>();
		String sel = request.getParameter("sel");
		String op = request.getParameter("op");

		try {
			list = dao.searAgreed(op, sel);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String data = "";
		if (list.size() == 0) {
			data += "<tr><td\tcolspan=\"4\">검색&nbsp;결과가&nbsp;없습니다.</td></tr>";
		} else {
			for (AgreedDto bean : list) {
				data += "<tr\tclass=\"bean\"><td>" + bean.getLectname() + "</td><td>" + bean.getLectstatu() + "</td><td>" + bean.getStuname() + "</td>";
				if (bean.getAgreed() == 1)
					data += "<td>Y</td>";
				else
					data += "<td><button\tclass=\"yes\"\tvalue=\"lectid="+bean.getLectid()+"&#38;stuid="+bean.getStuid()+"\">Y</button>/<button\tclass=\"no\"\tvalue=\"lectid="+bean.getLectid()+"&#38;stuid="+bean.getStuid()+"\">N</button></td>";
				data += "</tr>";
			}
		}
		PrintWriter print = response.getWriter();
		String dataEnco = URLEncoder.encode(data, "UTF-8");
		//System.out.println(data);
		print.print(dataEnco);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

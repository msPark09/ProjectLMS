package com.job.controller;

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
import com.lms.dto.JoblistDto;


public class JobSearCon extends HttpServlet {
	private List<JoblistDto> list;
	private SearchDao dao;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		dao = new SearchDao();
		String sel = request.getParameter("sel");
		String op = request.getParameter("op");

		try {
			list = dao.JobSearch(op, sel);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String data = "";
		if (list.size() == 0) {
		
			data += "<tr><td\tcolspan=\"3\">검색&nbsp;결과가&nbsp;없습니다.</td></tr>";
		} else {
			int cnt=0;
			for (JoblistDto bean : list) {
				data += "<tr\tclass=\"bean\"><td>"+(++cnt)+"</td><td><a href=\"./jobDetail?id="+bean.getId()+"\">" + bean.getJobname() + "</td><td>" + bean.getAdminid() + "</td></tr>";
			}
		}
		PrintWriter print = response.getWriter();
		String dataEnco = URLEncoder.encode(data, "UTF-8");
		//System.out.println(data);
		print.print(dataEnco);
	}
}

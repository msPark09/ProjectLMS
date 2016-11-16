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
import com.lms.dto.LectureDto;

public class TeaLectSearCon extends HttpServlet {

	private SearchDao dao;
	private List<LectureDto> list;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String op = request.getParameter("op").trim();
		String sel = request.getParameter("sel").trim();
		System.out.println("op : "+op+" sel : "+sel);
		// String id = request.getSession()("id")//���� �α��ΰ�� session���� ���� ����
		dao = new SearchDao();
		list = new ArrayList<LectureDto>();
		// list = dao.searLectOneTea(id,op,sel);
		try {
			list = dao.searLectOneTea(op, sel);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String data = "";
		if (list.size() > 0) {
			for (LectureDto bean : list) {
				data += "<tr class=\"bean\">"
						+ "<td><a href=\"projectlist?classid=" + bean.getClassid()
						+ "\">" + bean.getCname() + "</a></td>"
						+ "<td><a href=\"teachstulist?classid=" + bean.getClassid()
						+ "\">�����л�Ȯ��</a></td>" + "<td>" + bean.getDivision()
						+ "</td></tr>";
			}
		} else {
			data = "<tr><td colspan=\"3\">�˻� ����� �����ϴ�.</td></tr>";
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

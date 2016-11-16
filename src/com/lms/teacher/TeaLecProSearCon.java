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
import com.lms.dto.ProjectDto;

public class TeaLecProSearCon extends HttpServlet {
	
	private SearchDao dao;
	private List<ProjectDto> list;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String op = request.getParameter("op").trim();
		String sel = request.getParameter("sel").trim();
		String proid = request.getParameter("proid").trim();
		System.out.println("op : "+op+" sel : "+sel+" proid : "+proid);
		// String id = request.getSession()("id")//���� �α��ΰ�� session���� ���� ����
		dao = new SearchDao();
		list = new ArrayList<ProjectDto>();
		// list = dao.searLectOneTea(id,op,sel);
		try {
			list = dao.searLecProTea(op, sel, proid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String data = "";
		if (list.size() > 0) {
			for (ProjectDto bean : list) {
				data += "<tr class=\"bean\">"
						+ "<td><a href=\"./detailinsert?proid="+bean.getProid()+"&id="+bean.getId()+"\">"+bean.getSubname()+"</a></td>"
						+"<td>"+bean.getName()+"</td>";
				if(bean.getGrade()==0)
						data+= "<td><a href=\"./detailinsert?proid="+bean.getProid()+"&id="+bean.getId()+"\">�Է�</a></td>";
				else
						data+="<td><a href=\"./detailinsert?proid="+bean.getProid()+"&id="+bean.getId()+"\">"+bean.getGrade()+"</a></td>";
						
				data+="</tr>";
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

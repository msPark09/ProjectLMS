package com.lms.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.lang.jstl.test.Bean1;

import com.lms.dao.SearchDao;
import com.lms.dto.LectureDto;

public class AdmLectSearCon extends HttpServlet {

	private SearchDao dao = null;
	private List<LectureDto> list;
//	private JSONArray list;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sel = request.getParameter("sel").trim();
		String op = request.getParameter("op").trim();
		
		dao = new SearchDao();
		try {
			list = dao.selectOne(sel,op);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PrintWriter print = response.getWriter();
		String data ="";
		if(list.size()>0){
		for(LectureDto bean:list){
			data += "<tr class=\"bean\">"+
						"<td>"+bean.getCname()+"</td>"+
						"<td>"+bean.getDivision()+"</td>"+
						"<td>"+bean.getCnt()+"</td>"+
						"<td><a\thref=\"attend?lectid="+bean.getClassid()+"\">보&nbsp;기</a></td>"+
					"</tr>";
		}
		}else{
			data = "<tr><td\tcolspan=\"4\">검색&nbsp;결과&nbsp;학생이&nbsp;없습니다.</td></tr>";
		}
		System.out.println(data);
//		JSONObject jsonO = new JSONObject();
//		jsonO.put("list", list);
//		print.print(jsonO);
		String dataEnco = URLEncoder.encode(data,"UTF-8");
		print.print(dataEnco);
		response.setContentType("text/html;charset=UTF-8");
//		request.setAttribute("slist", list);
//		request.getRequestDispatcher("ResultsList.jsp").forward(request, response);
	}
}

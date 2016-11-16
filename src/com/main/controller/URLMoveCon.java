package com.main.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class URLMoveCon extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String urlString = request.getParameter("url");
		System.out.println(urlString);
		// 공지사항 : broad
		// 수강후기 : after
		// 강사채용 : joinT
		// 센터위치 : loc
		String moveUrl = "";
		if (urlString.equals("broad")) {
			moveUrl = "http://www.hanbitedu.co.kr/ab-1486275";
		} else if (urlString.equals("after")) {
			moveUrl = "http://www.hanbitedu.co.kr/ab-1486299&category_2=A";
		} else if (urlString.equals("joinT")) {
			moveUrl = "http://www.hanbitedu.co.kr/ab-1486317";
		} else if (urlString.equals("loc")) {
			moveUrl = "location.jsp";
		}
		System.out.println(moveUrl);
		response.sendRedirect(moveUrl);
	}

}

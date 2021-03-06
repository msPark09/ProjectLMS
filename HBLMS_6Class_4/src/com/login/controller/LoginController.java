package com.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import javax.websocket.Session;

import com.lms.dao.SelectAllDao;
import com.lms.dto.MemDto;


public class LoginController extends HttpServlet {

	private SelectAllDao dao;
	private MemDto dto;
	HttpSession session;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id").trim();
		String pw = request.getParameter("pw").trim();
		
		dao = new SelectAllDao();
		try {
			dto = dao.Login(id,pw);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//회원정보 확인
		
		String data = "";
		if(dto==null){
//			JOptionPane.showMessageDialog(null, "등록된 회원정보가 없습니다.", "메세지", JOptionPane.ERROR_MESSAGE);
//			response.sendRedirect("./loginform.do");
			data += "<script type=\"text/javascript\"> alert(\"아이디 또는 비밀번호가 다릅니다.\"); location.href=\"loginform.do\"; </script>";
			
			response.setCharacterEncoding("UTF-8");
			PrintWriter print = response.getWriter();
//			String dataEnco = URLEncoder.encode(data, "UTF-8");
			print.print(data);
			
		}else{
//			System.out.println("로그인 성공");
			String sess = dto.getId();
			int lv = dto.getLv();
			
			session = request.getSession();
			session.setAttribute("id", sess);
			session.setAttribute("result", true);
			session.setAttribute("lv", lv);
//			System.out.println(session.getAttribute("id"));
//			request.getRequestDispatcher("main").forward(request, response);
			request.getRequestDispatcher("./mypage").forward(request, response);
		}
		
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	doPost(req, resp);
	}

}

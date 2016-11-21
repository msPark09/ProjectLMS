package com.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.lms.dao.InsertDao;


public class UserInsertController extends HttpServlet {

	private InsertDao dao;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String pw=request.getParameter("pw");
		int lv=Integer.parseInt(request.getParameter("lv"));
		String mail=request.getParameter("mail_1")+"@"+request.getParameter("mail_2");
		String phone=request.getParameter("fistbon")+"-"+request.getParameter("num2")+"-"+request.getParameter("num3");
		String post=request.getParameter("post1")+"#"+request.getParameter("post2");
		String juso=request.getParameter("juso1")+"#"+request.getParameter("juso2");
		
		dao = new InsertDao();
		int result = 0;
		
		try {
			result = dao.UserInsert(id,name,pw,lv,mail,phone,post,juso);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0){
		//JOptionPane.showMessageDialog(null, "회원가입이 완료되었습니다.", "메세지", JOptionPane.PLAIN_MESSAGE);
		response.sendRedirect("loginform.do");
		}else{
			System.out.println("입력오류!");
			response.sendRedirect("error.jsp");
			
		}
	}

}

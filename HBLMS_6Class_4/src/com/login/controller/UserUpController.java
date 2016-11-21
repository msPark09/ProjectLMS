package com.login.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.lms.dao.UpdateDao;

public class UserUpController extends HttpServlet {

	private UpdateDao dao;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getCharacterEncoding();
		String id=request.getParameter("id");
		System.out.println(id);
		String name=request.getParameter("name");
		System.out.println(name);
		String pw=request.getParameter("pw");
		System.out.println(pw);
		int lv=Integer.parseInt(request.getParameter("lv"));
		System.out.println(lv);
		String mail=request.getParameter("mail_1")+"@"+request.getParameter("mail_2");
		System.out.println(mail);
		String phone=request.getParameter("fistbon")+"-"+request.getParameter("num2")+"-"+request.getParameter("num3");
		System.out.println(phone);
		String post=request.getParameter("post1")+"#"+request.getParameter("post2");
		System.out.println(post);
		String juso=request.getParameter("juso1")+"#"+request.getParameter("juso2");
		System.out.println(juso);
		
		
		dao = new UpdateDao();
		try {
			dao.UserUpdate(id,name,pw,lv,mail,phone,post,juso);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//JOptionPane.showMessageDialog(null, "수정이 완료되었습니다.", "메세지", JOptionPane.PLAIN_MESSAGE);
		response.sendRedirect("mypage.do");
	}

}

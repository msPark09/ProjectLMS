package com.main.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MypageController extends HttpServlet {

	//private DetailDao dao;
	//private LoginDto dto;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int lv = (int)session.getAttribute("lv");

//		dao = new DetailDao();
//		dto = dao.MemberOne(id);
//		
//		String[] phone = dto.getPhone().split("-");
//		String[] address = dto.getAddress().split("#");
//		String[] mail = dto.getMail().split("@");
		
		ArrayList<String> menuList = new ArrayList<String>();
		List<String> submenuList = new ArrayList<String>();

		if(lv==1){//학생
			menuList.add("개인정보수정");
			menuList.add("수강정보확인");
			menuList.add("회원조회");
			submenuList.add("mypage.do");
			submenuList.add("lectlist.do");
			submenuList.add("findUser.do");
		}else if(lv==2){//강사
			menuList.add("개인정보수정");
			menuList.add("성적관리");
			menuList.add("회원조회");
			submenuList.add("/HBLMS_6Class_4/mypage.do");
			submenuList.add("/HBLMS_6Class_4/teacher/teachlist");//강의리스트관리로 이동
			submenuList.add("/HBLMS_6Class_4/findUser.do");
		}else if(lv==3){//영업팀
			menuList.add("개인정보수정");
			menuList.add("마케팅관리");
			menuList.add("회원조회");
			submenuList.add("mypage.do");
			submenuList.add("main.jsp");//마케팅관리로 이동
			submenuList.add("findUser.do");
		}else if(lv==4){//행정팀(mapping완료)
			menuList.add("개인정보수정");
			menuList.add("수강생정보확인");
			menuList.add("수강신청확인");
			menuList.add("회원조회");
			submenuList.add("/HBLMS_6Class_4/mypage.do");
			submenuList.add("/HBLMS_6Class_4/admin/admlectlist");//수강생리스트로 이동
			submenuList.add("/HBLMS_6Class_4/admin/agreedlist");//수강신청확인으로 이동
			submenuList.add("/HBLMS_6Class_4/findUser.do");
		} 
		session.setAttribute("menu", menuList);
		session.setAttribute("slist", submenuList);
		//request.setAttribute("title", "마이페이지");
		
		session.setAttribute("id", id);
//		request.setAttribute("bean", dto);
//		request.setAttribute("phone", phone);
//		request.setAttribute("address", address);
//		request.setAttribute("mail", mail);
//		//request.getRequestDispatcher("login/mypage1.jsp").forward(request, response);
		request.getRequestDispatcher("mypage.jsp").forward(request, response);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}

}

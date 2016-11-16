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

		if(lv==1){//�л�
			menuList.add("������������");
			menuList.add("��������Ȯ��");
			menuList.add("ȸ����ȸ");
			submenuList.add("mypage.do");
			submenuList.add("lectlist.do");
			submenuList.add("findUser.do");
		}else if(lv==2){//����
			menuList.add("������������");
			menuList.add("��������");
			menuList.add("ȸ����ȸ");
			submenuList.add("/HBLMS_6Class_4/mypage.do");
			submenuList.add("/HBLMS_6Class_4/teacher/teachlist");//���Ǹ���Ʈ������ �̵�
			submenuList.add("/HBLMS_6Class_4/findUser.do");
		}else if(lv==3){//������
			menuList.add("������������");
			menuList.add("�����ð���");
			menuList.add("ȸ����ȸ");
			submenuList.add("mypage.do");
			submenuList.add("main.jsp");//�����ð����� �̵�
			submenuList.add("findUser.do");
		}else if(lv==4){//������(mapping�Ϸ�)
			menuList.add("������������");
			menuList.add("����������Ȯ��");
			menuList.add("������ûȮ��");
			menuList.add("ȸ����ȸ");
			submenuList.add("/HBLMS_6Class_4/mypage.do");
			submenuList.add("/HBLMS_6Class_4/admin/admlectlist");//����������Ʈ�� �̵�
			submenuList.add("/HBLMS_6Class_4/admin/agreedlist");//������ûȮ������ �̵�
			submenuList.add("/HBLMS_6Class_4/findUser.do");
		} 
		session.setAttribute("menu", menuList);
		session.setAttribute("slist", submenuList);
		//request.setAttribute("title", "����������");
		
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

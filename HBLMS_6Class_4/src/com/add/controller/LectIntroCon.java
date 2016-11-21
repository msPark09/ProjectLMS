package com.add.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.dao.SelectAllDao;
import com.lms.dto.LectureDto;

public class LectIntroCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SelectAllDao dao = new SelectAllDao();
		List<LectureDto> list = new ArrayList<LectureDto>();
		
		try{
			list = dao.LectList();
		}catch(Exception e){
			
		}
		
		request.setAttribute("title", "한빛과목및과정");
		
		ArrayList<String> mlist = new ArrayList<String>();
		ArrayList<String> slist = new ArrayList<String>();
		for(int i=0;i<list.size();i++){
			mlist.add(list.get(i).getCname());
			slist.add("./HBLectExplan.jsp?lectIdx="+(i+1));
		}
		mlist.add("수강신청");
		slist.add("./lecintro");
		request.setAttribute("list", list);
		request.setAttribute("menu", mlist);
		request.setAttribute("slist", slist);
		request.getRequestDispatcher("HBLectIntro.jsp").forward(request, response);
	}

}

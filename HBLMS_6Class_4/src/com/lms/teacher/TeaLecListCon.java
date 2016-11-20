package com.lms.teacher;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lms.dao.SelectAllDao;
import com.lms.dto.LectureDto;

public class TeaLecListCon extends HttpServlet{
	private List<LectureDto> list;
	private SelectAllDao dao =null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		dao= new SelectAllDao();
		list = new ArrayList<LectureDto>();
		try {
			list=dao.TeaLecList((String)session.getAttribute("id"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		req.setAttribute("alist", list);
		req.getRequestDispatcher("./tealeclist.jsp").forward(req,
				resp);

	}

}

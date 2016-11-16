package com.main.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.dao.DetailDao;

public class SearchIDPWCon extends HttpServlet {

	private DetailDao dao;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("./searchIDPW.jsp");
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("findid");
		String name = request.getParameter("name");
		String mail = request.getParameter("mail");
		request.getCharacterEncoding();
		String findID = "";

		int result = 0;
		int imgSel = 0;
		System.out
				.println("id : " + id + " name : " + name + " mail : " + mail);

		dao = new DetailDao();
		try {
			if (id == null || id.equals("")) {
				// 아이디 찾기
				findID = dao.findID(name, mail);
				if (findID.equals("") || findID == null) {
					findID = "<p>가입정보가 없습니다.</p>";
					imgSel = 1;
				} else {
					findID = "요청하신 아이디는 <strong>" + findID + "</strong> 입니다.";
				}
			} else {
				// 비밀번호 찾기
				String password = "";
				// 비밀번호 생성
				for (int i = 0; i < 8; i++) {
					char upperStr = (char) (Math.random() * 26 + 65);
					// char lowerStr = (char)(Math.random() * 26 + 97);
					if (i % 2 == 0) {
						password += (int) (Math.random() * 10);
					} else {
						password += upperStr;
					}
				}
				// 비밀번호 생성

				result = dao.findPW(id, password, name, mail);
				if (result > 0) {
					// 메일api 사용
					mailSender(request, mail, password);
					findID = "<p>임시 비밀번호를 메일로 보냈습니다.<p>";
				} else if (result == -1) {
					findID = "<p>가입정보가 없습니다.</p>";
					imgSel = 1;
				} else {
					findID = "<p>임시 비밀번호 생성 실패</p>";
					imgSel = 2;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("findID", findID);
		request.setAttribute("imgSel", imgSel);
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("findIDPW.jsp").forward(request, response);
	}

	//mail발송
	public void mailSender(HttpServletRequest request, String email, String pw) throws AddressException,
			MessagingException, Exception {

		// Google일 경우 smtp.gmail.com 을 입력합니다.
		String host = "smtp.gmail.com";

		//test계정입니다.
		final String username = "hb.class6.test@gmail.com"; 
		final String password = "q1w2e3r4!"; 

		// 메일 내용
		String recipient = email; // 받는 사람의 메일주소를 입력해주세요.
		String subject = "[한빛교육센터]임시비밀번호입니다."; // 메일 제목 입력해주세요.
		String body = "임시 비밀 번호는 " + pw + " 입니다."; // 메일 내용 입력해주세요.

		Properties props = new Properties(); // 정보를 담기 위한 객체 생성
		props.put("mail.smtp.auth", "true");

		// Session 생성
		Session session = Session.getDefaultInstance(props);

		Message mimeMessage = new MimeMessage(session); // MimeMessage 생성
		mimeMessage.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B")); // 제목셋팅
		mimeMessage.setText(body); // 내용셋팅
		mimeMessage.setFrom(new InternetAddress(username));
		mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(
				recipient));

		// 발송 처리
		Transport transport = session.getTransport("smtps");
		transport.connect(host, username, password);
		transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
		transport.close();

	}//mail발송

}

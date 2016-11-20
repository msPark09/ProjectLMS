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
				// ���̵� ã��
				findID = dao.findID(name, mail);
				if (findID.equals("") || findID == null) {
					findID = "<p>���������� �����ϴ�.</p>";
					imgSel = 1;
				} else {
					findID = "��û�Ͻ� ���̵�� <strong>" + findID + "</strong> �Դϴ�.";
				}
			} else {
				// ��й�ȣ ã��
				String password = "";
				// ��й�ȣ ����
				for (int i = 0; i < 8; i++) {
					char upperStr = (char) (Math.random() * 26 + 65);
					// char lowerStr = (char)(Math.random() * 26 + 97);
					if (i % 2 == 0) {
						password += (int) (Math.random() * 10);
					} else {
						password += upperStr;
					}
				}
				// ��й�ȣ ����

				result = dao.findPW(id, password, name, mail);
				if (result > 0) {
					// ����api ���
					mailSender(request, mail, password);
					findID = "<p>�ӽ� ��й�ȣ�� ���Ϸ� ���½��ϴ�.<p>";
				} else if (result == -1) {
					findID = "<p>���������� �����ϴ�.</p>";
					imgSel = 1;
				} else {
					findID = "<p>�ӽ� ��й�ȣ ���� ����</p>";
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

	//mail�߼�
	public void mailSender(HttpServletRequest request, String email, String pw) throws AddressException,
			MessagingException, Exception {

		// Google�� ��� smtp.gmail.com �� �Է��մϴ�.
		String host = "smtp.gmail.com";

		//test�����Դϴ�.
		final String username = "hb.class6.test@gmail.com"; 
		final String password = "q1w2e3r4!"; 

		// ���� ����
		String recipient = email; // �޴� ����� �����ּҸ� �Է����ּ���.
		String subject = "[�Ѻ���������]�ӽú�й�ȣ�Դϴ�."; // ���� ���� �Է����ּ���.
		String body = "�ӽ� ��� ��ȣ�� " + pw + " �Դϴ�."; // ���� ���� �Է����ּ���.

		Properties props = new Properties(); // ������ ��� ���� ��ü ����
		props.put("mail.smtp.auth", "true");

		// Session ����
		Session session = Session.getDefaultInstance(props);

		Message mimeMessage = new MimeMessage(session); // MimeMessage ����
		mimeMessage.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B")); // �������
		mimeMessage.setText(body); // �������
		mimeMessage.setFrom(new InternetAddress(username));
		mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(
				recipient));

		// �߼� ó��
		Transport transport = session.getTransport("smtps");
		transport.connect(host, username, password);
		transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
		transport.close();

	}//mail�߼�

}

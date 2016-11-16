<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="application/download;charset=UTF-8"%>
<%@ page import="java.io.*"%>
<%
	String num = request.getParameter("num");
	response.setContentType("application/download");

	String fileName = request.getParameter("filename");
	fileName = URLEncoder.encode(fileName,"UTF-8");

	//아래처럼 attachment 를 사용하면 브라우저는 무조건 다운로드 창을 띄우고 파일명을 보여준다.
	response.setHeader("Content-Disposition", "attachment;filename="
			+ fileName + ";");

	ServletOutputStream sos = null;
	try {
		sos = response.getOutputStream();
	} catch (Exception e) {
		e.printStackTrace();
	}

	//다음과 같이 스트림을 열고 브라우저에 바이트 데이터를 전송해주면 된다.
	FileInputStream fio = null;
	byte[] buf = new byte[1024];
	
	fileName = URLDecoder.decode(fileName,"UTF-8");
	String url = request.getRealPath("upload")+"/";
	fio = new FileInputStream(url + fileName);
	int n = 0;

	while ((n = fio.read(buf, 0, buf.length)) != -1) {
		sos.write(buf, 0, n);
		sos.flush();
	}
	sos.close();
%>
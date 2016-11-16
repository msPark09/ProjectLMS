<%@page import="com.lms.dto.LectureDto"%>
<%@page import="com.lms.dao.SelectAllDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>

<%
	SelectAllDao dao = new SelectAllDao();
	List<LectureDto> list = dao.Todo();

	//	String sName = list.get(0).getCname();
	//	int nBunho = list.get(0).getPriority();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마케팅관리</title>
</head>
<body>
	<h1>추천과목 우선순위 관리</h1>
	<form action="./editP.do" >
		<table width="400" border="1">
			<tr>
				<th align="center">제목</th>
				<th>우선순위</th>
			</tr>

			<%
				for (int i = 0; i < list.size(); i++) {
					//String sKeyname = "classname" + i;
					String sKeyname = list.get(i).getClassid();
					//String Cmn = list.get(i).getCname();
			%>
			<tr>
				<td width="300" valign="top"><%=list.get(i).getCname()%></td>
				<td><input type="text" name="<%=sKeyname%>" id="priority"
					value=<%=list.get(i).getPriority()%>></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td colspan="2"><p>
						<button type="submit">확 인</button>
						<button type="reset">취 소</button></td>
			</tr>
		</table>
	</form>
</body>
</html>
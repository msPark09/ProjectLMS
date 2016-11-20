<%@page import="java.util.ArrayList"%>
<%@page import="com.lms.dto.LectureDto"%>
<%@page import="com.lms.dao.SelectAllDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
/*TodoDao dao = new TodoDao();
List<TodoDto> list = dao.Todo();

 DosDao dos = new DosDao();

 session.setAttribute("LOGIN", dos);
 */
 	SelectAllDao dao = new SelectAllDao();
	List<LectureDto> list = dao.LectList();
	request.setAttribute("title", "한빛과목및과정");
	ArrayList<String> mlist = new ArrayList<String>();
	ArrayList<String> slist = new ArrayList<String>();
	for(int i=0;i<list.size();i++){
		mlist.add(list.get(i).getCname());
		slist.add("./HBLectExplan.jsp?lectIdx="+(i+1));
	}
	mlist.add("수강신청");
	slist.add("./HBLectIntro.jsp");
	request.setAttribute("menu", mlist);
	request.setAttribute("slist", slist);
	
 
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./css/grid.css" />
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.main').addClass("grid10");//main부분의 그리드 잡기
	});
</script>
<title>수강신청</title>
<style type="text/css">
div {
	text-align: center;
}

.path {
	margin-top: 10px;
	text-align: right;
	font-size: 11px;
	text-decoration: none;
	font-weight: bold;
	color: black;
}

.path a {
	text-decoration: none;
}
.okInserLec{
align:center;
width: 100%;
margin: 10px;
}
.okInserLec input{
width: 100px;
height: 30px;
border-style: none;
background-color: #ff4d4d;
font-weight: bold;
color: white;
margin: 10px;
}
a{
text-decoration: none;
color: black;
}
@media screen and (min-width:1180px) {
	/*pc 버전*/
	.main {
		height: 550px;
	}
}

@media screen and (max-width: 1179px) {
	/*모바일 버전*/
	.content .side {
		display: inline-block;
		width: 100%;
	}
	.main {
		height: 480px;
	}
	.path {
		display: none;
	}
}
</style>
</head>
<body>
<div class="container">
		<jsp:include page="/template/header.jsp"></jsp:include>
		<jsp:include page="/template/menu.jsp"></jsp:include>
		<div class="content row">
			<div class="grid2 side">
				<jsp:include page="/template/sidemenu.jsp"></jsp:include>
			</div>
			<div class="main">
				<div class="path">
					<p>
						<a href="./main">HOME</a> > 한빛과목및과정
					</p>
				</div>
<form method=get action="InserLectStu.do">
<!--  <h1>수강신청</h1>-->
<!--<h1><%String classid = request.getParameter("classid"); %></h1>
<h1><%String id = request.getParameter("id"); %></h1>-->
<table class="okInserLec">

	<h1>수강신청이 완료되었습니다.</h1>
	<p>확인버튼을 눌러 수강상태를 확인하시길 바랍니다.</p>
	<tr>
		<input type="text" name="id" value=<%=id %> hidden="hidden">
		<input type="text" name="classid" value=<%=classid %> hidden="hidden">
		
		<td><input type="submit" value="확인"></input></td>		
	</tr>
	<%-- 
		<td width="300" valign="top"><a href="./login.jsp"><%=list.get(i).getCname() %></a></td>
			<td width="100"><%=list.get(i).getCinfo() %></td>
			<td width="50"><%=list.get(i).getPriority()%></td> --%>
</table>
</form>
</div>
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
</body>
</html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lms.dao.SelectAllDao"%>
<%@page import="com.lms.dto.LectureDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<%@ page import="java.util.List"%>
<%
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
	String lectIdx = request.getParameter("lectIdx");
	String url="./lectlist/lectlist"+lectIdx.trim()+".jsp";
	int idx = Integer.parseInt(lectIdx.trim());
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style type="text/css">
div {
	text-align: center;
}

table {
	width: 98%;
	height: 100%;
	margin-left: 10px;
	margin-top: 10px;
}

a {
	text-decoration: none;
	color: black;
}

table td {
	border-bottom: 1px #ccc dotted;
}

table th {
	border-top: 2px red solid;
	border-bottom: 2px red solid;
}

table td:nth-child(1) {
	width: 20%;
}

table td:nth-child(2) {
	width: 70%;
	text-align: left;
}

table td:nth-child(3) {
	width: 10%;
}

.lectInfo{
width: 100%;
}
.lectInfo img{
width: 90%;
margin: 5px;
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

.lectBtn{
width:100%;
height: 90%;
line-height: 90%;
}
.lectInfo img{
width: 90%;
height: 90%;
}

@media screen and (min-width:1180px) {
	/*pc 버전*/
	.main {
		height: 1300px;
	}
}

@media screen and (max-width: 1179px) {
	/*모바일 버전*/
	.content .side {
		display: inline-block;
		width: 100%;
	}
	.main {
		height: 660px;
	}
	.path {
		display: none;
	}
	.lectInfo{
	height: 90%;
}
.lectInfo img{
	height: 90%;
}
}
</style>
<title>한빛LMS</title>
</head>
<body>
	<!-- <h1>수강신청</h1>-->
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
						<a href="./main">HOME</a> > <a href="./HBLectIntro.jsp">한빛과목및과정</a> > <%=list.get(idx-1).getCname() %>
					</p>
				</div>
				<div class="lectInfo">
				<!-- 과목설명 -->		
				<jsp:include page="<%=url %>"></jsp:include>
				</div>
			</div>
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
</body>
</html>
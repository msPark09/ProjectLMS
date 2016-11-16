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
	//UnoDao dao1 = new UnoDao();

	int login = 0;

	String url = "";
	String id = "";
	id = (String)session.getAttribute("id");
	
	if(id==null||id.equals(""))
		login = 0;//비로그인상태
	else
		login = 1;//로그인상태
	
	if (login == 1) {
		url = "./inserLecStuCheck.jsp";//수강신청확인페이지
	} else {
		url = "./loginform.do";//로그인페이지
	}
		
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
		/*$('.Ssubmenu').eq(0).attr('href','./jobList');//취업정보
		$('.Ssubmenu').eq(1).attr('href','./moveURL?url=broad');//공지사항
		$('.Ssubmenu').eq(2).attr('href','./moveURL?url=after');//수강후기
		과목 과정 url 연결 필요!!
		 */
		$(document).on('mouseover', '.bean', function() {
			$(this).css('backgroundColor', '#f2f2f2');
		}).on('mouseout', '.bean', function() {
			$(this).css('backgroundColor', '#ffffff');
		});
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
	width: 10%;
}

table td:nth-child(2) {
	width: 45%;
	text-align: left;
}

table td:nth-child(3) {
	width: 20%;
}
table td:nth-child(4) {
	width: 25%
}

.lectimg {
	margin-top: 10px;
}

.lectimg>img {
	width: 85%;
	height: 80%;
	margin-left: 10px;
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
width:85%;
line-height: 100%;
height:105%;
border-style: none;
background-color: #ff4d4d;
color: white;
font-weight: bold;
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
						<a href="./main">HOME</a> > 한빛과목및과정
					</p>
				</div>
				<!--  이미지수정 -->
				<div class="lectimg">
					<img alt="lect" src="./imgs/lectlist.png">
				</div>
				<!--  이미지수정 -->
				<form method="get" action="<%=url%>">
					<table>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>구분</th>
							<th>수강신청</th>

						</tr>

						<%
							for (int i = 0; i < list.size(); i++) {
						%>
						<tr class="bean">

							<input type="text" readonly="readonly" hidden="hidden" name="id"
								id="id" value="<%=id%>">
							<input type="text" readonly="readonly" hidden="hidden"
								name="classid" id="classid"
								value="<%=list.get(i).getClassid()%>">
							<td><%=list.get(i).getPriority()%></td>
							<td><%=list.get(i).getCname()%></td>
							<td><%=list.get(i).getDivision()%></td>
							<td><button type="submit" class="lectBtn">수강신청</button></td>
						</tr>
						<%
							}
						%>
					</table>
				</form>
			</div>
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
</body>
</html>
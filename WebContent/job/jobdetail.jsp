<%@page import="com.lms.dto.JoblistDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setAttribute("title", "고객센터");
	ArrayList<String> mlist = new ArrayList<String>();
	mlist.add("취업정보");
	mlist.add("공지사항");
	mlist.add("수강후기");
	ArrayList<String> slist = new ArrayList<String>();
	slist.add("./jobList");//취업정보
	slist.add("/HBLMS_6Class_4/moveURL?url=broad");//공지사항
	slist.add("/HBLMS_6Class_4/moveURL?url=after");//수강후기
	request.setAttribute("menu", mlist);
	request.setAttribute("slist", slist);
	int cnt =1;
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>한빛LMS</title>
<link rel="stylesheet" href="./../css/grid.css" />
<script type="text/javascript" src="./../js/jquery-1.11.3.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.main').addClass("grid10");//main부분의 그리드 잡기
		
	$(document).on('mouseover','.bean', function(){
		$(this).css('backgroundColor', '#f2f2f2');
	}).on('mouseout','.bean', function(){
		$(this).css('backgroundColor', '#ffffff');
	})
});

</script>
<style type="text/css">
div {
	text-align: center;
}
table{
width: 98%;
height:80%;
margin-left:10px;
margin-top: 10px;
}
a{
text-decoration: none;
color: black;
}

table td{
border-bottom: 1px #ccc dotted;
text-align: left;
}
table th{
border-top: 2px red solid;
border-bottom: 2px red solid;
}

table th:nth-child(1){
width:70%;
}
table th:nth-child(2){
width:15%;
font-weight: normal;
}
.path{
margin-top: 10px;
text-align:right;
font-size: 11px;
text-decoration: none;
font-weight: bold;
color:black;
}
.path a{
text-decoration: none;
}

@media screen and (min-width:1180px) {
	/*pc 버전*/
	.main{
		height: 550px;
	}
}

@media screen and (max-width: 1179px) {
/*모바일 버전*/
	.content .side{
	display: inline-block;
	width: 100%;
	}
	.main{
	height: 610px;}
	.path{
	display: none;
	}
	table{
	width: 95%;
	height: 98%;
	}
}

</style>

</head>
<body>
	<div class="container">
		<jsp:include page="./../template/header.jsp"></jsp:include>
		<jsp:include page="./../template/menu.jsp"></jsp:include>

		<div class="content row">
			<div class="grid2 side">
				<jsp:include page="./../template/sidemenu.jsp"></jsp:include>
			</div>
			<div class="main">
			<div class="path">
			<p><a href="/HBLMS_6Class_4/main">HOME</a> > <a href="./jobList">고객센터</a> > <a href="./joblist">취업정보</a> > 구인상세정보</p>
			</div>
		<table>
			<tr>
				<th>${dto.jobname }</th>
				<th>작성자 : ${dto.adminid }</th>
			</tr>
			<c:if test="${empty dto }">
				<tr>
					<td colspan="2">상세정보가 없습니다.</td>
				</tr>
			</c:if>
				<tr>
					<td colspan="2">${dto.jobcont }</td>
				</tr>
				<tr>
					<td colspan="2"><a href="http://${dto.jobweb }">${dto.jobweb }</a></td>
				</tr>
				<tr>
					<td colspan="2"><a target="_self" href="/HBLMS_6Class_4/download.jsp?filename=${dto.jobfile }">${dto.jobfile }</a></td>
				</tr>
		</table>
			</div>
		</div>
		<jsp:include page="./../template/footer.jsp"></jsp:include>
	</div>
	<!-- container end -->
</body>
</html>
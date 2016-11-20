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
	slist.add("./../moveURL?url=broad");//공지사항
	slist.add("./../moveURL?url=after");//수강후기
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
	});
	
	var url = "./JobSearch.do";
	var target = $('table');
	$('form').submit(function() {
		var op = $('#op').val();
		var sel = $('#sel').val();
		var param = {'op':op, 'sel':sel};
		$.ajax({
				'url':url,
				'data':param,
				'error' : function(jqXHR, textStatus) {
					alert("통신실패 " + textStatus + "(code): "	+ jqXHR.status);},
				'success' : function(data, textStatus,jqXHR) {	
					target.html("<table><tr><th>번호</th><th>구인구직</th><th>작성자</th></tr>");
					data = data.replace(/\+/gi,'%20');
					data = decodeURIComponent(data);
					target.append(data);
					target.append("</table>");
					}
			});
		return false;
	});


});

</script>
<style type="text/css">
div {
	text-align: center;
}
table{
width: 98%;
height: 100%;
margin-left:10px;
margin-top: 10px;

}
a{
text-decoration: none;
color: black;
}

table td{
border-bottom: 1px #ccc dotted;

}
table th{
border-top: 2px red solid;
border-bottom: 2px red solid;
}

table td:nth-child(1){
width:10%;
}
table td:nth-child(2){
width:70%;
text-align: left;
}
table td:nth-child(3){
width:20%;
}
.jobimg{
margin-top: 10px;
}
.jobimg>img{
width: 85%;
height:80%;
margin-left: 10px;
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
	height: 480px;}
	.path{
	display: none;
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
			<p><a href="./../main">HOME</a> > <a href="./jobList">고객센터</a> > 취업정보</p>
			</div>
			<div class="jobimg"><img alt="job" src="/HBLMS_6Class_4/imgs/job.png"></div>
			<form action="./JobSearch.do">
		<table>
			<tr>
				<th>번호</th>
				<th>구인구직</th>
				<th>작성자</th>
			</tr>
			<c:if test="${empty list }">
				<tr>
					<td colspan="3">구인을 희망하는 사업처가 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach items="${list }" var="bean">
				<tr class="bean">
					<td><%=cnt++ %></td>
					<td><a href="./jobDetail?id=${bean.id}">${bean.jobname}</a></td>
					<td>${bean.adminid}</td>
				</tr>
			</c:forEach>
		</table>
		<div class="search">
		<p>
			<a href="#">1</a>
		</p>
		<select name="op" id="op">
			<option value="0">제목</option>
			<option value="1">작성자</option>
		</select> <input type="text" id="sel" name="sel" />
		<button type="submit" id="search">검 색</button>
		</div>
	</form>
			</div>
		</div>
		<jsp:include page="./../template/footer.jsp"></jsp:include>
	</div>
	<!-- container end -->
</body>
</html>
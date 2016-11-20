<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	
	ArrayList<String> list = (ArrayList<String>)session.getAttribute("menu");
	request.setAttribute("menu", list);
	ArrayList<String> hreList = (ArrayList<String>)session.getAttribute("slist");
	request.setAttribute("slist", hreList);
	request.setAttribute("title", "마이페이지");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./../css/grid.css" />
<title>한빛LMS</title>
<script type="text/javascript" src="./../js/jquery-1.11.3.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.main').addClass("grid10");//main부분의 그리드 잡기

	$(document).on('mouseover','.bean', function(){
		$(this).css('backgroundColor', '#f2f2f2');
	}).on('mouseout','.bean', function(){
		$(this).css('backgroundColor', '#ffffff');
	});
	
	$('form').submit(function() {
		var url = $(this).attr('action');
		var sel = $('#sel').val();
		var op = $('#op').val();
		
		var target = $('table');
		var param = {'sel':sel, 'op':op};
		$.ajax({
				'url':url,
				'data':param,
				'error' : function(jqXHR, textStatus) {
					alert("통신실패 " + textStatus + "(code): "	+ jqXHR.status);},
				'success' : function(data, textStatus,jqXHR) {	
					target.html("<table><tr><th>강의명</th><th></th><th>구분</th></tr>");
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
width:45%;
}
table td:nth-child(2){
width:30%;
}
table td:nth-child(3){
width:25%;
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
			<p><a href="./../main">HOME</a> > <a href="./../mypage">마이페이지</a> > 성적관리</p>
			</div>
		<form action="./searchLecT.do">
		<table>
			<tr>
				<th>강의명</th>
				<th></th>
				<th>구분</th>
			</tr>
			<c:if test="${empty alist }">
				<tr>
					<td colspan="3">강의 내역이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach items="${alist }" var="bean">
				<tr class="bean">
					<td><a href="./projectlist?classid=${bean.classid}">${bean.cname}</a></td>
					<td><a href="./teachstulist?classid=${bean.classid}">수강학생확인</a></td>
					<td>${bean.division}</td>
				</tr>
			</c:forEach>
		</table>
		<p>
			<a href="#">1</a>
		</p>
		<select name="op" id="op">
			<option value="0">통합검색</option>
			<option value="1">수강종료</option>
			<option value="2">수강중</option>
		</select> <input type="text" id="sel" name="sel" />
		<button type="submit">검 색</button>
	</form>
	</div>
	</div>
	<jsp:include page="./../template/footer.jsp"></jsp:include>
	</div>
	<!-- container end -->
</body>
</html>
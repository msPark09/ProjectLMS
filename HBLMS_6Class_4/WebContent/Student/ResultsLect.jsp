<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>한빛LMS</title>
<link rel="stylesheet" href="./css/grid.css" />
<script type="text/javascript" src="./js/jquery-1.11.3.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.main').addClass("grid10");//main부분의 그리드 잡기
	
});
$('a').onclick(function() {
	var url = $(this).attr('href');
	var type = "application/x-www-form-urlencoded; charset=UTF-8";
	
	var target = $('table');
	$.ajax({
			'type':post,
			'url':url,
			'contentType': type,
			'error' : function(jqXHR, textStatus) {
				alert("통신실패 " + textStatus + "(code): "	+ jqXHR.status);},
			'success' : function(data) {
				var msg = decodeURIComponent(data);
				target.append(msg);
				}
		});
	return false;
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
width:40%;
}
table td:nth-child(2){
width:20%;
}
table td:nth-child(3){
width:20%;
}
table td:nth-child(4){
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
		<jsp:include page="/template/header.jsp"></jsp:include>
		<jsp:include page="/template/menu.jsp"></jsp:include>

		<div class="content row">
			<div class="grid2 side">
				<jsp:include page="/template/sidemenu.jsp"></jsp:include>
			</div>
			<div class="main">
			<form action="lectone.do">
				<table>
				<input type="hidden" id="id" name="id" value="${id }"/>
					<tr>
						<th>강의명</th>
						<th>강 사</th>
						<th>구 분</th>						
						<th>수강일</th>
					</tr>
					<c:forEach items="${stlist }" var="bean">
						<tr>
							<td><a href="List.do?lectid=${bean.classid }&id=${id }">${bean.cname }</a></td>
							<td>${bean.teacname}</td>
							<td>${bean.division}</td>
							<td>${bean.startday}</td>
						</tr>
					</c:forEach>
					<tr><td colspan="4">${emptyList }</td></tr>
				</table>
				<p><a href="#">1</a></p>
				<select name="op">
					<option value="0">통합검색</option>
				</select>
				<input type="text" id="sel" name="sel"/>
				<button type="submit">검  색</button>
			</form>	
			</div>
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
	<!-- container end -->
</body>
</html>
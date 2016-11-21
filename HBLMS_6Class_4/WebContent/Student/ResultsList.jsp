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
<!DOCTYPE html>
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
$('a').on('click',function() {
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
width:30%;
}
table td:nth-child(2){
width:40%;
}
table td:nth-child(3){
width:15%;
}
table td:nth-child(4){
width:15%;
}
.projectinfo>h2{
margin: 10px;
}
.projectinfo>h3{
text-align: right;
margin-right: 20px;
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
				<div class="projectinfo">
					<h2>${cname }</h2>
					<h3>${teacname }</h3>
				</div>
			<form action="listone.do">
				<table>
				<input type="hidden" id="lectid" name="lectid" value="${lectid }">
				<input type="hidden" id="id" name="id" value="${id }">
					<tr>
						<th>프로젝트이름</th>
						<th>프로젝트내용</th>
						<th>프로젝트날짜</th>
						<th>과제제출</th>
					</tr>
					<c:forEach items="${alist }" var="bean">
						<tr>
							<td><a href="content.do?proid=${bean.proid }&stuid=${bean.stuid }&lectid=${bean.lectid }">${bean.proname }</a></td>
							<td>${bean.procont }</td>
							<td>${bean.proday }</td>
							<td><a href="add.do?proid=${bean.proid }&stuid=${bean.stuid }&lectid=${bean.lectid }&lect=${bean.lect }">제출</a></td>
						</tr>
					</c:forEach>
				</table>
				<p><a href="#">1</a></p>
				<select id="op" name="op">
					<option value="0">이  름</option>
					<option value="1">내  용</option>
					<option value="2">강사명</option>
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
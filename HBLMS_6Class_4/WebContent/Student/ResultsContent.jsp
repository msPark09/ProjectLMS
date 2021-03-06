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
.lecL{
border-bottom: 1px #ccc dotted;
}

.lecT{
border-top: 2px red solid;
border-bottom: 2px red solid;
}

table th:nth-child(1){
width: 100px; 
}
table th:nth-child(7){
width: 100px; 
}

table th:nth-child(2n){
text-align: left;
}

table tr:nth-child(1){
height: 30px; 
}
table tr:nth-child(2){
height: 30px; 
}
table tr:nth-child(3){
height: 50px; 
}
table tr:nth-child(4){
height: 30px; 
}
table tr:nth-child(5){
height: 200px; 
}
table tr:nth-child(6){
height: 30px; 
}

button {
width: 80px;
height: 40px;
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
			<form action="edit.do">
			<input type="hidden" id="proid" name="proid" value="${bean.proid }">
			<input type="hidden" id="stuid" name="stuid" value="${bean.id }">
			<table>
				<tr>
					<th class="lecT">강의</th>
					<th class="lecT" colspan="3">${bean.proname }</th>
				</tr>
				<tr>
					<th class="lecL" colspan="2">제목</th>
				</tr>
				<tr>
					<td colspan="2">${bean.subname }</td>
				</tr>
				<tr>
					<th class="lecL" colspan="4">내용</th>
				</tr>
				<tr>
					<td colspan="4">${bean.proexp }</td>
				</tr>
				<tr>
					<th class="lecL" >파일</th>
					<th class="lecL" colspan="3"><a target="_blank" href="file/${bean.proren }">${bean.proorin }</a></th>
				</tr>
			</table>
			
			<button type="submit">수  정</button>
			<button type="reset">취  소</button>
			</form>
			</div>
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
	<!-- container end -->
</body>
</html>
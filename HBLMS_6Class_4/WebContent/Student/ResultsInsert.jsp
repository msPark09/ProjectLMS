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
.main {
	text-align: left;
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
			<form action="insert.do" method="post" enctype="multipart/form-data">
				<table border="1">
					<input type="hidden" id="proid" name="proid" value="${proid }">
					<input type="hidden" id="stuid" name="stuid" value="${stuid }">
					<input type="hidden" id=lectid name="lectid" value="${lectid }">
					<tr>
						<th>강의</th>
						<td colspan="3">${lect }</td>
					</tr>
					<tr>
						<th colspan="4">제목</th>
					</tr>
					<tr>
						<td colspan="4"><input type="text" id="subname" name="subname"/></td>
					</tr>
					<tr>
						<th colspan="4">내용</th>
					</tr>
					<tr>
						<th colspan="4"><textarea id="proexp" name="proexp" rows="" cols=""></textarea></th>
					</tr>
					<tr>
						<th>파일</th>
						<td colspan="3"><input type="file" id="proorin" name="proorin"></td>
					</tr>
				</table>
				<button type="submit">확  인</button>
				<button onclick="history.back()">뒤  로</button>
			</form>
			</div>
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
	<!-- container end -->
</body>
</html>
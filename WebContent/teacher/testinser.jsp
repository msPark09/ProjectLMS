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
	int cnt=0;
	%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
width:15%;
}
table td:nth-child(2){
width:50%;
}
table td:nth-child(3){
width:15%;
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
.title>td:nth-child(1){
font-weight: bold;
}
.title>td:nth-child(3){
font-weight: bold;
}
.exp>td:nth-child(1){
font-weight: bold;
border-top: 2px red solid;
border-bottom: 2px red solid; 
}
.expsub>td{
height: 50%;
}
.expsub{
height: 50%;
}
.file>td:first-child{
font-weight: bold;
}
.file>td:nth-child(2){
text-align: left;
}
.gradeP>td:first-child{
font-weight: bold;
}
.gradeP>td:first-child{
font-weight: bold;
}
.gradeP>td:nth-child(2){
width: 90%;
text-align: left;
}
.okBtn>td:first-child{
text-align: left;
align:left;
}
.okBtn td button{
width: 30%;
border-style: none;
background-color: #ff4d4d;
color:white;
height: 30px;
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
    <form action="./gradeinsert">
	<table>
		<tr>
			<th colspan="4">프로젝트 내용</th>
		</tr>
		<!--<c:forEach items="${prodetaillist }" var="bean">-->
			<tr class="title">
			<td>제목</td>
				<td>${dto.subname }</td>
			<td>제출자</td>
				<td>${dto.name }</td>
			</tr>
			<tr class="exp">
				<td colspan="4">내용</td>
			</tr>
			<tr class="expsub">
				<td colspan="4">${dto.proexp}</td>
			</tr>
			<tr class="file">
				<td>파일명</td>
				<td colspan="3"><a target="_self" href="./../download.jsp?filename=${dto.proorin }">${dto.proorin }</a></td>
			</tr>
		<tr class="gradeP">
			<td rowspan="2">성적</td>
			<c:if test="${dto.grade eq 0 }">
			<td colspan="3"><input type="text" name="grade" id="grade"></td>
			</c:if>
			<c:if test="${dto.grade ne 0 }"><!-- empty가 아닌걸로 -->
			<td colspan="3"><input type="text" name="grade" id="grade" value="${dto.grade }"></td>
			</c:if>
		</tr>
		<input type="text" name="testid" id="testid" value="${dto.testid}"  hidden="hidden">
		<input type="text" name="id" id="id" value="${dto.id}"  hidden="hidden">
		<input type="text" name="proid" id="proid" value="${proid}"  hidden="hidden">
		</c:forEach>
		<tr class="okBtn">
			<td colspan="3"><button type="submit">입력</button> <button
				type="reset">취소</button>
			</td>
		</tr>
	</table>
	</form>
	</div>
	</div>
	<jsp:include page="./../template/footer.jsp"></jsp:include>
	</div>
	<!-- container end -->
</body>
</html>
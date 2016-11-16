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
		var url="./AgreedSearch.do";
		var op = $('#op').val();
		var sel = $('#sel').val();
		var param = {'op':op, 'sel':sel};
		var target = $('table');
		$.ajax({
				'url':url,
				'data':param,
				'error' : function(jqXHR, textStatus) {
					alert("통신실패 " + textStatus + "(code): "	+ jqXHR.status);},
				'success' : function(data, textStatus,jqXHR) {	
					target.html("<table><tr><th>강의명</th><th>구분</th><th>신청자</th><th>승인여부</th></tr>");
					data = data.replace(/\+/gi,'%20');
					data = decodeURIComponent(data);
					target.append(data);
					target.append("</table>");
					}
			});
		return false;
	});
	 	
	$(document).on('click','.yes',function(){
		//수강신청 승인
		var url = $(this).attr('value');
		    var r = window.confirm("수강신청을 승인하시겠습니까?");
		    	//alert(url+" href : "+"./insertagreed?"+url);
		    if (r == true) {
		        location.href="./insertagreed?"+url;
		    }
		    return false;
	});
	$(document).on('click','.no',function(){
	//수강신청 반려
	//alert("click");
		var url = $(this).attr('value');
	    var r = window.confirm("수강신청을 반려하시겠습니까?");
		    	//alert(url);
	    if (r == true) {
	        location.href = "./deleteagreed?"+url;
	    }
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
width:15%;
}
table td:nth-child(3){
width:10%;
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
			<p><a href="./../main">HOME</a> > <a href="./../mypage">마이페이지</a> > 수강신청확인</p>
			</div>
	<form action="./AgreedSearch.do">
		<table>
			<tr>
				<th>강의명</th>
				<th>구분</th>
				<th>신청자</th>
				<th>승인여부</th>
			</tr>
			<c:if test="${empty alist }">
				<tr>
					<td colspan="4">수강 승인 요청이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach items="${alist }" var="bean">
				<tr class="bean">
					<td>${bean.lectname}</td>
					<td>${bean.lectstatu}</td>
					<td>${bean.stuname}</td>
					<c:if test="${bean.agreed eq 0}">
					<td><button class="yes" value="lectid=${bean.lectid}&stuid=${bean.stuid}">Y</button>/<button class="no" value="lectid=${bean.lectid}&stuid=${bean.stuid}">N</button></td>
					</c:if>
					<c:if test="${bean.agreed eq 1}">
					<td>Y</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		<p>
			<a href="#">1</a>
		</p>
		<select name="op" id="op">
			<option value="0">제목</option>
			<option value="1">구분</option>
			<option value="2">이름</option>
			<option value="3">수강신청</option>
		</select> <input type="text" id="sel" name="sel" />
		<button type="submit" id="search">검 색</button>
	</form>
	</div>
	</div>
	<jsp:include page="./../template/footer.jsp"></jsp:include>
	</div>
	<!-- container end -->
</body>
</html>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" href="./../css/grid.css" />
<script type="text/javascript" src="./../js/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.main').addClass("grid10");//main부분의 그리드 잡기

		$(document).on('mouseover','.bean', function(){
			$(this).css('backgroundColor', '#f2f2f2');
		}).on('mouseout','.bean', function(){
			$(this).css('backgroundColor', '#ffffff');
		});
		
		var url = "./AttendSearch.do";
		var lectid=$('#lectid').text();
		var target = $('table');
		var totalday = $('#lectday').text()/2;
		
		$('.lectid').css('display', 'none');
		//이름검색
		$('form').submit(function() {
			var op = 1;
			var sel = $('#sel').val();
			var param = {'totalday':totalday, 'op':op, 'lectid':lectid, 'sel':sel};
			$.ajax({
					'url':url,
					'data':param,
					'error' : function(jqXHR, textStatus) {
						alert("통신실패 " + textStatus + "(code): "	+ jqXHR.status);},
					'success' : function(data, textStatus,jqXHR) {	
						target.html("<table><tr><th>이름</th><th>출석일수</th><th>출석율</th><th>전화번호</th></tr>");
						data = decodeURIComponent(data);
						target.append(data);
						target.append("</table>");
						}
				});
			return false;
		});
		//출석율 50프로
		$('.halfAttend').on('click', function() {
			var op = 0;
			var sel = "";
			var param = {'totalday':totalday, 'op':op, 'lectid':lectid, 'sel':sel};
			$.ajax({
					'url':url,
					'data':param,
					'error' : function(jqXHR, textStatus) {
						alert("통신실패 " + textStatus + "(code): "	+ jqXHR.status);},
					'success' : function(data, textStatus,jqXHR) {	
						target.html("<table><tr><th>이름</th><th>출석일수</th><th>출석율</th><th>전화번호</th></tr>");
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
.lect{
	display: none;
}
div {
	text-align: center;
}
.main {
	text-align: left;
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
table{
width: 98%;
height: 100%;
margin-left:10px;
margin-top: 10px;
text-align: center;

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
width:10%;
}
table td:nth-child(4){
width:30%;
}
.downSear{
text-align: center;
width: 100%;
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
			<p><a href="./../main">HOME</a> > <a href="./../mypage">마이페이지</a> > 수강생정보확인</p>
			</div>
			
	<h1 id="lectid" class="lect">${lectid }</h1>
	<h1 id="lectday" class="lect">${totalDay }</h1>
	<form action="AttendSearch.do">
		<table>
			<tr>
				<th>이름</th>
				<th>출석일수</th>
				<th>출석율</th>
				<th>전화번호</th>
			</tr>
			<c:if test="${empty alist }">
				<tr>
					<td colspan="4">수강생이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach items="${alist }" var="bean">
				<tr class="bean">
					<td>${bean.name}</td>
					<td>${bean.attday} / ${totalDay}</td>
					<td class="ratio"><fmt:formatNumber
							value="${bean.attday/totalDay*100/100}" pattern=".00%" /></td>
					<td><a href="tel:${bean.ph }">${bean.ph }</a></td>
				</tr>
			</c:forEach>
		</table>
		<div class="downSear">
		<p>
			<a href="#">1</a>
		</p>
		<button class="halfAttend">출석율 50%미만</button>
		<input type="text" id="sel" name="sel" />
		<button type="submit">검 색</button>
		</div>
	</form>
	</div>
		</div>
		<jsp:include page="./../template/footer.jsp"></jsp:include>
	</div>
	<!-- container end -->
</body>
</html>
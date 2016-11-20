<%@page import="com.lms.dto.LectureDto"%>
<%@page import="com.lms.dao.SelectAllDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
//SelectAllDao dao = new SelectAllDao();
//List<LectureDto> list = dao.Todo();
request.setAttribute("title", "마이페이지");
ArrayList<String> mlist = (ArrayList<String>)session.getAttribute("menu");
request.setAttribute("menu", mlist);
ArrayList<String> hreList = (ArrayList<String>)session.getAttribute("slist");
request.setAttribute("slist", hreList);	
	//	String sName = list.get(0).getCname();
	//	int nBunho = list.get(0).getPriority();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./css/grid.css" />
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.main').addClass("grid10");//main부분의 그리드 잡기
	
});
</script>
 <style type="text/css">
div {
	text-align: center;
	/*상단 메메뉴 */
}
.main {
	position: relative;
	text-align: center;
	/*창 글씨 */
}


table{
/*창크기  */
width: 58%;
height: 20%;
margin-left:20%;
margin-top: 10%;


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
<title>마케팅관리</title>
</head>
<body leftmargin="10" onload="f2.id.focus();">
<div class="container">
		<jsp:include page="/template/header.jsp"></jsp:include>
		<jsp:include page="/template/menu.jsp"></jsp:include>
	<div class="content row">
			<div class="grid2 side">
		<jsp:include page="/template/sidemenu.jsp"></jsp:include>
			
			</div>
			<div class="main">
	<div class="path">
		<p><a href="./main">HOME</a> > <a href="./mypage">마이페이지</a> > 개인정보수정</p>
</div>
	<h1>추천과목 우선순위 관리</h1>
	<form action="./editP.do" >
		<table width="300">
			<tr>
				<th align="center">제목</th>
				
				<th>우선순위</th>
			</tr>
			<c:forEach items="${list }" var="bean">
			<tr>
				<td width="300" valign="top">${bean.cname}</td>
				<td width="100"><input type="text" size="1"   name="${bean.classid}" id="priority"
					value="${bean.priority}"></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="2"><p>
						<button type="submit">확 인</button>
						<button type="reset">취 소</button></td>
			</tr>
		</table>
			
	</form>
	</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
</body>
</html>
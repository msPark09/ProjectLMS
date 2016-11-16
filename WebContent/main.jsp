<%@page import="com.lms.dto.LectureDto"%>
<%@page import="com.lms.dao.SelectAllDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>

<%
	SelectAllDao dao = new SelectAllDao();
	List<LectureDto> list = dao.Todo();
		
	
//	String sName = list.ge//t(i).getCname();
//	int nBunho = list.get(i).getPriority();
%>


<!DOCTYPE html>
<html>
<head>
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
}
.main {
	text-align: left;
}
table{
width: 98%;

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
		height: 800px;
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마케팅관리</title>
</head>
<body leftmargin="10" onload="f2.id.focus();">
<div class="container">
		<jsp:include page="/template/header.jsp"></jsp:include>
		<jsp:include page="/template/menu.jsp"></jsp:include>
	<div class="content row">
			<div class="grid2 side">
		
			</div>
			<div class="main">
	<div class="path">
		<p><a href="./main">HOME</a> > <a href="./mypage">마이페이지</a> > 개인정보수정</p>
</div>
	<h1>추천과목 우선순위 관리</h1>
	<table width="400" border="1"  >
		<tr>
			<th>제목</th> 
		     <th>우선순위</th>		
		</tr>
			<%
				for(int i=0; i<list.size(); i++){
			%>
		 <tr>
			<td width="300" valign="top"><%=list.get(i).getCname() %></td>
			<td><%=list.get(i).getPriority()%></td>
		 </tr>
			<%		
				
				}
				
			%>
		<tr>
			<td colspan="2"><p>
				<a href="./edit_form.jsp"><input type="submit" value="수  정"></a>
				<a href="./main.jsp"><input type="submit" value="확  인"></a>
				<a href="./main.jsp"><input type="reset" value="취  소"></a>
			</td>
			
		</tr>
		
		</table>
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
	
</body>
</html>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
   <%
	request.setAttribute("title", "교육서비스");
	ArrayList<String> mlist = new ArrayList<String>();
	mlist.add("국비지원 취업반");
	mlist.add("재직자 취업반");
	mlist.add("졸업예정 취업반");
	request.setAttribute("menu", mlist);
	ArrayList<String> slist = new ArrayList<String>();
	for(int i=0;i<mlist.size();i++){
		slist.add("./introduce.jsp?introIdx="+(i+1));
	}
	request.setAttribute("slist", slist);
	String indtroIdx = request.getParameter("introIdx");
	String url="./introduce/menu"+indtroIdx+".html";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>한빛LMS</title>
<link rel="stylesheet" href="css/grid.css" />
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
a{
text-decoration: none;
color:black;
}

@media screen and (min-width:1180px) {
	/*pc 버전*/
	.main{
		height: 1300px;
	}
}

@media screen and (max-width: 1179px) {
/*모바일 버전*/
	.content .side{
	display: inline-block;
	width: 100%;
	}
	.main{
	height: 635px;}
	.path {
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
				<jsp:include page="<%=url %>"></jsp:include>
			</div>
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
	<!-- container end -->
</body>
</html>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<String> list = (ArrayList<String>) request
	.getAttribute("menu");
ArrayList<String> sublist =(ArrayList<String>) request.getAttribute("slist");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>한빛LMS</title>
<script type="text/javascript" src="/HBLMS_6Class_4/js/jquery-1.11.3.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">
ul{
text-decoration: none;
list-style: none;
}
@media screen and (min-width: 1180px) {
	/*PC~Tablet버전*/
	.sidemenu {
		margin: 5px;
		text-decoration: none;
	}
	.ul {
		align: center;
		height: 300px;
		text-decoration: none;
	}
	.ul li {
		margin-top: 20px;
		margin-left: 0px;
		margin-right: 0px;
		border-bottom: 2px #b3b3b3 dotted;
		width: 100%;
		text-align: left;
		text-decoration: none;
	}
	.ul li a {
		color: black;
		margin-left: 15px;
		text-decoration: none;
	}
	.sidemenu img {
		width: 100%;
	}
	.p {
		font-weight: bold;
	}
	.p p {
		border: 5px #ff4d4d solid;
	}
}

@media screen and (max-width: 1179px) { /*mobile버전*/

	.img {
		display: none;
	}
	.p {
		font-weight: bold;
		width: 23%;
		border: 5px #ff4d4d solid;
		box-sizing: border-box;
		text-align: center;
		line-height: 40px;
		overflow: hidden;
	}
	.sidemenu .up {
		margin: 5px;
		display: inline-block;
		float: left;
		height: 55px;
		font-size: 83%;
		text-decoration: none;
	}
	.ul {
		display: inline-block;
		line-height: 50px;
		width: 70%;
		overflow: hidden;
		aligen: center;
		margin-left: 30px;
		text-decoration: none;
	}
	.ul li {
		float: left;
		width: 22%;
		height: 40px;
		margin-left: 3px;
		margin-right: 3px;
		border-bottom: 2px red solid;
		text-decoration: none;
		text-align: center;
	}
	.ul li a {
		margin: 1px;
		color: black;
		text-decoration: none;
	}
}
</style>
</head>
<body>
	<div class="sidemenu">
		<div class="p up">
			<p><%=request.getAttribute("title")%></p>
		</div>
		<div class="ul up">
			<ul>
				<%
					for (int i =0; i<list.size();i++) {
				%>
				<li><a href="<%=sublist.get(i)%>" class="Ssubmenu"> <%=list.get(i)%></a></li>
				<%
					}
				%>
			</ul>
		</div>
		<div class="img">
			<a href="/HBLMS_6Class_4/moveURL?url=joinT"><img alt="sm1"
				src="/HBLMS_6Class_4/imgs/sidemenu.gif"></a> <a href="/HBLMS_6Class_4/moveURL?url=loc"><img
				alt="sm2" src="/HBLMS_6Class_4/imgs/sidemenu2.gif"></a>
		</div>
	</div>
</body>
</html>
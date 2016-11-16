<%@page import="com.lms.dto.LectureDto"%>
<%@page import="java.util.List"%>
<%@page import="com.lms.dao.SelectAllDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	SelectAllDao dao = new SelectAllDao();
	List<LectureDto> list = dao.LectList();
	int cnt=0;
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var edu = "교육서비스";
		var hb = "한빛과목및과정";
		var cous = "고객센터";
		$('.upmenu>li').on('mouseenter',function(){
			var text = $(this).text();
			if(text==edu){
			//alert(text);
				$('.intro').fadeIn(500);
				$('.HBLect').hide();
				$('.HBjob').hide(0);				
			}else if(text==hb){
			//alert(text);				
				$('.intro').hide();
				$('.HBLect').fadeIn(500);
				$('.HBjob').hide();
			}else{
			//alert(text);		
				$('.intro').hide();
				$('.HBLect').hide();
				$('.HBjob').fadeIn(500);
			}
		});
		$('.submenu li:last-child').on('mouseleave',function(){
		//alert("짠");
			$('.intro').hide();
			$('.HBLect').hide();
			$('.HBjob').hide();
		});
	});
</script>
<style type="text/css">
.intro{
display: none;
}
 .HBLect{
display: none;
 }
 .HBjob{
display: none;
 }
.menu div {
	background-color: #ff4d4d;
	text-align: center;
}

.menu ul {
	width: 100%;
	height: 30px;
	display: inline-block;
}

.menu ul>li {
	width: 33%;
	text-align: center;
	float: left;
	list-style: none;
}

.menu ul>li>a {
	width: 100%;
	text-decoration: none;
	font-weight: bold;
	line-height: 30px;
	margin: 10px;
	color: white;
}


.submenu li {
	border: 1px red solid;
	box-sizing: border-box;
	width: 100%;
	height: 50px;
	background-color: white;
	display: inline-block;
}

.submenu a {
	color: black;
	height: 50px;
	text-align: center;
	line-height: 50px;
}

@media screen and (max-width: 1179px) { /*mobile버전*/
	.submenu>li {
		overflow: hidden;
	}
	.submenu a {
		font-size: 90%;
	}
	#HBLectsub1{
	display: none;
	}
	#HBLectsub3{
	display: none;
	}
	#HBjobsub1{
	display: none;
	}
	#HBjobsub2{
	display: none;
	}
}
</style>
</head>
<body>
	<div class="menu row">
		<div class="grid12">
			<ul class="upmenu">
				<li><a href="./introduce.jsp?introIdx=0">교육서비스</a></li>
				<li><a href="./HBLectIntro.jsp">한빛과목및과정</a></li>
				<li><a href="./jobList">고객센터</a></li>
			</ul>
		</div>
	</div>
	<div class="submenu row">
		<div class="grid12 intro">
			<div class="grid4" id="introsub1">
			<ul>
			<li><a href="introduce.jsp?introIdx=1">국비지원 취업반</a></li>
			<li><a href="introduce.jsp?introIdx=2">재직자 취업반</a></li>
			<li><a href="introduce.jsp?introIdx=3">졸업예정 취업반</a></li>
			</ul>
			</div>
			<div class="grid4" id="introsub2">
			&nbsp;
			</div>
			<div class="grid4" id="introsub3">
			&nbsp;
			</div>
		</div>
		<div class="grid12 HBLect">
			<div class="grid4" id="HBLectsub1">
			&nbsp;
			</div>
			<div class="grid4" id="HBLectsub2">
			<ul>
			<%for(LectureDto bean : list){ %>
			<li><a href="HBLectExplan.jsp?lectIdx=<%=(++cnt)%>"><%=bean.getCname() %></a></li>
			<%} %>
			<li><a href="HBLectIntro.jsp">수강신청</a></li>			
			</ul>
			</div>
			<div class="grid4" id="HBLectsub3">
			&nbsp;
			</div>
		</div>
		<div class="grid12 HBjob">
			<div class="grid4" id="HBjobsub1">
			&nbsp;
			</div>
			<div class="grid4" id="HBjobsub2">
			&nbsp;
			</div>
			<div class="grid4" id="HBjobsub3">
			<ul>
			<li><a href="jobList">취업정보</a></li>
			<li><a href="moveURL?url=broad">공지사항</a></li>
			<li><a href="moveURL?url=after">수강후기</a></li>
			</ul>
			</div>
		</div>
	</div>
</body>
</html>
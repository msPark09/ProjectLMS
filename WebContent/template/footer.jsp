<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.mfooter').on('click', function() {
			$('.footer p').toggle();
			return false;
		});
	});
</script>
<style type="text/css">
.footer {
	background-color: #b3b3b3;
}

@media screen and (min-width: 1180px) {
	/*PC~Tablet버전*/
	.footer {
		height: 175px;
	}
	.footer div {
		margin-top: 10px;
		float: left;
		display: inline-block;
		align: center;
	}
	.footer img {
		width: 70%;
		margin: 3% auto;
	}
	.footer p {
		align: left;
		text-align: left;
		display: inline-block;
	}
	.footer a {
		display: none;
	}
	.flogin {
		display: none;
	}
		.fimg{
	display: none;
	}

}

@media screen and (max-width: 1179px) and (min-width: 600px) {
 /*tablet버전(login의 위치를 위해 tablet버전을 추가합니다.)*/
	.footer a {
		display: inline-block;
		margin: 0px;
		text-align: center;
		font-size: 25px;
		align: center;
		text-decoration: none;
		color: white;
		text-shadow: 2px 2px black;
		line-height: 40px;
	}
	.footer img {
		width: 80%;
	}
	.footer p {
		background-color: #b3b3b3;
		display: none;
	}
	.footer {
		height: 75px;
	}
	.flogin {
		display: none;
	}
	.fimg{
	display: inline-block;
	width: 100%;
	}
}

@media screen and (max-width: 599px) { /*mobile버전*/
	.footer a {
		display: inline-block;
		margin: 0px;
		text-align: center;
		font-size: 25px;
		align: center;
		text-decoration: none;
		color: white;
		text-shadow: 2px 2px black;
		line-height: 40px;
	}
	.footer img {
		width: 80%;
		height: 100%;
	}
	.footer p {
		background-color: #b3b3b3;
		display: none;
		height: 100%;
	}
	.flogin {
		height: 100%;
		text-align: center;
		align:center;
	}
	.footer {
		height: 75px;
	}
  .flogin{
  height: 100%;
  }
  .flogin .logout{
  margin: 5px;
  }
  .flogin .login{
  margin: 5px;
  }

}
</style>
</head>
<body>
	<div class="grid12 flogin">
	
		<%
			if (session.getAttribute("id") != null) {
				if ((Boolean) session.getAttribute("result")) {
		%>
		<p class="logout">
			<%=session.getAttribute("id")%>님 환영합니다.
		</p>
		<p class="logout"><a href="logout.do" id="logout">로그아웃</a> <a href="./mypage">마이페이지</a>
		</p>
		<%
			}
			} else {
		%>
		<p class="login">
			<a href="loginform.do">로그인</a> <a href="gaip.do">회원가입</a> <a href="./searchIDPW.jsp">ID/PW찾기</a>
		</p>
		<%
			}
		%>
	</div>
	<div class="grid12 fimg">
	<a href="./moveURL?url=joinT"><img alt="sm1" src="imgs/sidemenu.gif"></a> <a
				href="./moveURL?url=loc"><img alt="sm2" src="imgs/sidemenu2.gif"></a>
	</div>
	<div class="footer row">
		<div class="grid3">
			<img alt="footerlogo" src="imgs/footerlogo.png">
		</div>
		<div class="mfooter">
			<a href="#">▼</a>
		</div>
		<div class="grid9">
			<p>
				(주)한빛이엔아이 공식홈페이지｜사업자등록번호 : 220-85-43667｜통신판매신고 : 마포 제 0358호｜TEL :
				02-707-1480 | 대표이사 : 염기호 <br />한빛교육센터신촌 홈페이지 관리자 : 김도환｜주소 : 121-854
				서울시 마포구 신수동 63-14 구프라자 3층 <br />한빛교육센터강남 : 서울특별시 강남구 테헤란로 5길 11 유빌딩
				3층 <br />한빛교육센터종로 : 서울특별시 종로구 종로2가 YMCA 빌딩 7층 <br />Copyright (c)
				2016 한빛교육센터 All rights reserved. Hosting by 4조
			</p>
		</div>
	</div>
</body>
</html>
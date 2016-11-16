<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
@media screen and (min-width: 1180px) {
	/*PC버전*/
	.header img {
		width: 70%;
	}
	.header div {
		text-align: center;
		align: center;
	}
	.header>div>img {
		margin-top: 10px;
	}
	.login {
		text-align: center;
		align: center;
		margin-top: 15px;
	}
	.logout{
	margin:5px;
	}

}
  @media screen and (max-width: 1179px) and (min-width: 600px) {
  /*tablet버전(광고 이미지를 위해 tablet버전을 추가합니다.)*/
  .header .grid3{
  width:100%;
  }
  .ad1>img{
  	width:30%;
  }
  .header .login{
  height: 100%;
  text-align: center;
  align:center;
  }
  .login>p{  
  margin:5px;
  }
  .header{
  height:100%;
  }
  .login{
  height: 50px;
  }

}

@media screen and (max-width: 599px) { /*mobile버전*/
	.ad1 {
		display: none;
	}
	.logo  img{
		width: 90%;
	}
	.header>.login {
		display: none;
	}
}
</style>
</head>
<body>
	<div class="header row">
		<div class="grid3 ad1">
			<img alt="ad1" src="/HBLMS_6Class_4/imgs/ad1.jpg">
		</div>
		<div class="grid6 logo">
			<a href="/HBLMS_6Class_4/main"><img alt="logo" src="/HBLMS_6Class_4/imgs/logo_ai.png"></a>
		</div>
		<div class="grid3 login">
			<%
				if (session.getAttribute("id") != null) {
					if ((Boolean) session.getAttribute("result")) {
			%>
			<p class="logout">
				<%=session.getAttribute("id")%>님 환영합니다.
			</p>
			<p class="logout"><a href="/HBLMS_6Class_4/logout.do" id="logout">로그아웃</a> <a href="/HBLMS_6Class_4/mypage">마이페이지</a>
			</p>
			<%
				}
				} else {
			%>
			<p class="login">
				<a href="/HBLMS_6Class_4/loginform.do">로그인</a> <a href="/HBLMS_6Class_4/gaip.do">회원가입</a> <a href="/HBLMS_6Class_4/searchIDPW.jsp">ID/PW찾기</a>
			</p>
			<%
				}
			%>
		</div>

	</div>
</body>
</html>
</body>
</html>
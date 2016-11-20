<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>한빛LMS</title>
<link rel="stylesheet" href="./css/grid.css" />
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.searchIDPW>a:eq(1)').attr('href', './main');
	});
</script>
<style type="text/css">
div {
	text-align: center;
}

a {
	text-decoration: none;
	color: black;
}

.findid {
	margin-top: 20px;
	width: 100%;
}
.imgSel img{
width: 90%;
margin: 15px auto;
}

.move p {
	float: left;
	width: 28%;
	margin: 20px 5px 0px 5px;
	background-color: #ff4d4d;
	border-radius : 3px;
	align:center;
}
.move a{
color: white;
}

@media screen and (min-width: 600px) {
	/*PC~Tablet버전*/
	.aside {
		display: none;
	}
	.main {
		height: 550px;
	}
}

@media screen and (max-width: 599px) {
	/*mobile버전*/
	.main {
		height: 480px;
	}
}
</style>

</head>
<body>
	<div class="container">
		<jsp:include page="/template/header.jsp"></jsp:include>
		<jsp:include page="/template/menu.jsp"></jsp:include>

		<div class="content row">
			<div class="main">
				<!-- content start -->
				<div class="grid12">
					<div class="grid3">&nbsp;</div>
					<div class="grid6">
						<div class="imgSel">
							<c:choose>
								<c:when test="${imgSel eq 0 }">
								<img alt="welcom" src="./imgs/welcom.png"></c:when>
								<c:when test="${imgSel eq 1 }">
								<img alt="sorry" src="./imgs/sorry.png"></c:when>
								<c:otherwise>
								<img alt="oops" src="./imgs/oops.jpg">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="findid">${findID }</div>
						<div class="move">
							<p>
								<a href="./loginform.do">로그인</a>
							</p>
							<p>
								<a href="./gaip.do">회원가입</a>
							</p>
							<p>
								<a href="./searchIDPW.jsp">ID/PW찾기</a>
							</p>
						</div>
					</div>
					<div class="grid3">&nbsp;</div>
				</div>
				<!-- content start -->
			</div>
			<!-- sidemenum : pc버전 메인화면에서 노출 없음 > 메뉴 클릭 후 이동, 마이페이지등에서 노출 -->
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
	<!-- container end -->
</body>
</html>
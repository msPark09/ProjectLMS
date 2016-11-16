<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		$('.main').addClass("grid12");//main부분의 그리드 잡기
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

.main img {
	width: 95%;
	height: 90%;
	margin: 20px auto;
}

.fimg img{
	display: none;
}

@media screen and (min-width: 600px) {
	/*PC~Tablet버전*/
	.main {
		height: 600px;
	}
}

@media screen and (max-width: 599px) {
	/*mobile버전*/
	.main {
		height: 480px;
	}
}

.side {
	display: none;
}
</style>

</head>
<body>
	<div class="container">
		<jsp:include page="/template/header.jsp"></jsp:include>
		<jsp:include page="/template/menu.jsp"></jsp:include>

		<div class="content row">
			<div class="grid2 side">
				<!-- sidemenum : pc버전 메인화면에서 노출 없음 > 메뉴 클릭 후 이동, 마이페이지등에서 노출 -->
				<jsp:include page="/template/sidemenu.jsp"></jsp:include>
			</div>
			<div class="main">
				<!-- content start -->
				<img alt="main" src="./imgs/main.png">
				<!-- content start -->
			</div>
			<!-- sidemenum : pc버전 메인화면에서 노출 없음 > 메뉴 클릭 후 이동, 마이페이지등에서 노출 -->
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
	<!-- container end -->
</body>
</html>
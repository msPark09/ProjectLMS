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
			$('.searchIDPW>a:eq(1)').attr('href', './main');
		var target = $('.searchIDPW');
		$('.main').addClass("grid12");//main부분의 그리드 잡기
		$('#id').on('click', function() {
			$('.searchIDPW:eq(0)').css('display', 'none');
			$('#formID').css('display', 'block');
			$('.searchIDPW>a:eq(1)').attr('href', './searchIDPW.jsp');
		});
		$('#pw').on('click', function() {
			$('.searchIDPW:eq(0)').css('display', 'none');
			$('#formPW').css('display', 'block');
			$('.searchIDPW>a:eq(1)').attr('href', './searchIDPW.jsp');
		});
	});
</script>
<style type="text/css">
.formIDPW {
	display: none;
}

.formIDPW form div {
	float: left;
	height: 100%;
}

.formIDPW>form>div:first-child {
	width: 60%;
	text-align: right;
}

.formIDPW>form>div:last-child {
	width: 20%;
	text-align: left;
}

#formID button {
	width: 40px;
	height: 40px;
	margin: 3px;
	background-color: red;
	color: white;
	font-weight: bold;
}

#formPW button {
	width: 50px;
	height: 50px;
	margin: 3px;
	background-color: red;
	color: white;
	font-weight: bold;
}

div {
	text-align: center;
}

a {
	text-decoration: none;
	color: black;
}

.searchIDPW {
	text-align: center;
	align: center;
	width: 90%;
	display: inline-block;
}

.searchIDPW p {
	float: left;
	width: 50%;
	align: center;
	margin: 10px auto;
}

.searchIDPW img {
	width: 90%;
}

button {
	background-color: white;
	border: none;
}


@media screen and (min-width: 600px) {
	/*PC~Tablet버전*/
	.aside {
		display: none;
	}
	.main {
		height: 550px;
	}
	.formIDPW {
		margin: 50px auto;
		width: 100%;
	}
}

@media screen and (max-width: 599px) {
	/*mobile버전*/
	.main {
		height: 480px;
	}
	.searchIDPW p {
		float: none;
		align: center;
		margin: 5px auto;
	}
	.searchIDPW {
		width: 70%;
		height: 80%;
	}
	.formIDPW>form>div:first-child {
		width: 75%;
		text-align: right;
	}
	.formIDPW>form>div:last-child {
		width: 25%;
		text-align: center;
		margin: 12px auto;
	}
	.formIDPW {
		height: 100%;
		width: 80%;
		margin: 10px auto;
		float: left;
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

						<div class="searchIDPW">
							<p>
								<button id="id">
									<img alt="id" src="./imgs/id.png">
								</button>
							</p>
							<p>
								<button id="pw">
									<img alt="" src="./imgs/pw.png">
								</button>
							</p>
						</div>
						<div class="formIDPW" id="formID">
							<form action="./searchIDPW" method="post">
								<div>
								<p>
										<label for="name">이름 : </label> <input type="text" id="name"
											name="name" />
									</p>
									<p>
										<label for="mail">EMAIL : </label> <input type="text"
											id="mail" name="mail" />
									</p>
								</div>
								<div>
									<button type="submit">찾기</button>
								</div>
							</form>
						</div>

						<div class="formIDPW" id="formPW">
							<form action="./searchIDPW" method="post">
								<div>
									<p>
										<label for="findid">아이디 : </label> <input type="text" id="findid"
											name="findid" />
									</p>
									<p>
										<label for="name">이름 : </label> <input type="text" id="name"
											name="name" />
									</p>
									<p>
										<label for="mail">EMAIL : </label> <input type="text"
											id="mail" name="mail" />
									</p>
								</div>
								<div>
									<button type="submit">찾기</button>
								</div>
							</form>
						</div>
						<div class="searchIDPW">
							<a href="gaip.do">회원가입</a> <a>뒤로가기</a>
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
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript">
	function goList() {
		window.history.back();
	}
	$(document).ready(function() {
		window.setTimeout('goList()', 3000);
	});
</script>
</head>
<body>
<h1>입력 오류입니다.</h1>
<h3>3초뒤 전페이지로 이동합니다.</h3>
</body>
</html>
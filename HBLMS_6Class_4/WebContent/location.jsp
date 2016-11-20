<%@page import="java.util.ArrayList"%>
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

<script>
      function initMap() {
        var myLatLng = {lat: 37.544393, lng: 127.126711};
       

        // Create a map object and specify the DOM element for display.
        var map = new google.maps.Map(document.getElementById('map'), {
          center: myLatLng,
          scrollwheel: false,
          zoom: 15
        });

        // Create a marker and set its position.
        var marker = new google.maps.Marker({
          map: map,
          position: myLatLng,
          title: '한빛 교육센터 천호점'
        });
      }

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAeFk1hfdKq_iLUsm0HDa2dGA3drTypS-8&callback=initMap"
        async defer></script>
<style type="text/css">
a{
text-decoration: none;
color: black;
}
.path{
margin: 10px;
text-align: right;
font-size: 11px;
font-weight: bold;
}

#map{
 height: 70%; 
 }
 #addr{
 margin-top:10px;
 margin-bottom:7px;
 border:0.5px red solid;
 box-sizing:border-box;
 }
 #addr>p{
  text-align: left;
  margin: 10px;
 }
 #anoter{
 margin-bottom: 20px; 
 }
 #anoter a{
 text-decoration: none;
 color: black;
 }
div {
	text-align: center;
}

@media screen and (min-width:1180px) {
	/*pc 버전*/
	.main {
		height: 650px;}
	#map{
		margin-top: 15px;
		margin-left: 15px;
	 }
	 #addr{
	 margin-left: 15px;}
	 
}

@media screen and (max-width: 1179px) {
	/*모바일 버전*/
	.content .side {
		display: inline-block;
		width: 100%;
	}
	.main {
		height: 600px;
	}
	.path{
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
			<div class="main">
				<div class="path"><a href="./main">HOME</a> > 교육센터 위치</div>
				<div id="map"></div>
				<div id="addr"><p><strong>회사 주소 : </strong>서울특별시 강동구 천호동 360</p><p><strong>대표 전화 :</strong> 02-1234-5678 </p></div>
				<div id="anoter"><a href="http://www.hanbitedu.co.kr/ab-1486260">다른 지점 보기 >> </a></div>
			</div>
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
	<!-- container end -->
</body>
</html>
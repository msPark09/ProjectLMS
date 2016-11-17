<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%response.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>한빛LMS</title>
<link rel="stylesheet" href="./css/grid.css" />
<style type="text/css">
div {
	text-align: center;
}
.main {
	text-align: left;
	display: inline-block;
	align:center;
}
.main>form{
margin: 0px auto;
align:center;
width:100%;
}
.main>form>table{
margin: 40px auto;
align:center;
}
a{
text-decoration: none;
color: black;
}

@media screen and (min-width: 600px) {
	/*PC~Tablet버전*/
	.aside {
		display: none;
	}
	.main{
		height: 550px;
	}
}

@media screen and (min-width:1180px) {
	/*pc 버전*/
	.main{
		height: 550px;
	}
}

@media screen and (max-width: 1179px) {
/*모바일 버전*/
	.content .side{
	display: inline-block;
	width: 100%;
	}
	.main{
	height: 480px;}
}

.ul{
	display: none;
}
.p{
	display: none;
}
</style>
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.main').addClass("grid12");//main부분의 그리드 잡기
	});
	
	$('form').submit(function() {
		var url = $(this).attr('action');
		var id = $('#id').val();
		var pw = $('#pw').val();
		var type = "application/x-www-form-urlencoded; charset=UTF-8";
		
		var target = $('table');
		var param = {'id':id, 'pw':pw};
		$.ajax({
				'type':post,
				'url':url,
				'data':param,
				'contentType': type,
				'error' : function(jqXHR, textStatus) {
					alert("통신실패 " + textStatus + "(code): "	+ jqXHR.status);},
				'success' : function(data) {
					var msg = decodeURIComponent(data);
					target.append(msg);
					}
			});
			return false;
		});
		
    function space(){
        if (event.keyCode==32){                             
            event.returnValue=false;
        }
    }

    function log(){
        if(f1.id.value==""){
            alert("아이디를 입력하세요");
            document.f1.id.focus();
        }else if(f1.pw.value==""){
            alert("비밀번호를 입력하세요");
            document.f1.pw.focus();
        }else{
            document.f1.submit();
        }
    }

</script>
</head>
<body>
	<div class="container">
		<jsp:include page="/template/header.jsp"></jsp:include>
		<jsp:include page="/template/menu.jsp"></jsp:include>

		<div class="content row">
		<div class="main grid12">
			<div>
		<img alt="login" src="./imgs/login.jpg">
            </div>
			<FORM name="f1" action="./login.do" method="post">    
			<TABLE border="1" frame="boxs" rules="none" align="center">
			    <TR>
			        <TH align="center" colspan="2">
			        회원로그인
			        </TH>
			    </TR> 
			    <TR>
			        <TD> 아이디 </TD>
			        <TD> <INPUT type="text" size="10" name="id" id="id" onkeypress="space();"/> </TD>
			    </TR>
			    <TR>
			        <TD> 비밀번호 </TD>
			        <TD>
			            <INPUT type="password" size="10" name="pw" id="pw" onkeypress="space();"/>
			            <INPUT type="button" value="로그인" name="login" onclick="log();"/>
			        </TD>
			    </TR>
			   
			    <TR>
			        <TD height="35" align=center colspan="2" >
			        <TABLE height="20" border="2" frame="void" rules="cols">
			            <TD>
			                <FONT size="2"> <A href="gaip.do"> 회원가입 </A> </FONT>
			            </TD>
			            <TD>
			                <FONT size="2"> <A href="./searchIDPW.jsp"> 아이디/비밀번호 찾기 </A> </FONT>
			            </TD> 
			        </TABLE>
			        </TD>  
			    </TR>
			</TABLE>
			</FORM>
			</div>
		</div>
		<jsp:include page="/template/footer.jsp"></jsp:include>
	</div>
	<!-- container end -->
</body>
</html>
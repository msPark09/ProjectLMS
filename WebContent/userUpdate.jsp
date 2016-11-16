<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
ArrayList<String> list = (ArrayList<String>)session.getAttribute("menu");
request.setAttribute("menu", list);
ArrayList<String> hreList = (ArrayList<String>)session.getAttribute("slist");
request.setAttribute("slist", hreList);

request.setAttribute("title", "마이페이지");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>한빛LMS</title>
<link rel="stylesheet" href="./css/grid.css" />
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.main').addClass("grid10");//main부분의 그리드 잡기
	
});
</script>
<SCRIPT language="javascript">

  
  function space(){
   if (event.keyCode==32){
    event.returnValue=false;
   }
  }

  function sutja(){
   if ((event.keyCode<48)||(event.keyCode>57) ){
    alert ("숫자로 입력해주세요.");	
    event.returnValue = false;	
   }
  }
    
   function sujang(){
    if(f2.id.value==""){
     alert("이름을 입력하세요");
     document.f2.id.focus();
    }else if(f2.pw.value==""){
     alert("비밀번호를 입력하세요");
     document.f2.pw.focus();
    }else if(f2.pw.value.length<4){
     alert("비밀번호를 4글자 이상 입력해주세요.");
     document.f2.pw.focus();
     return true;
    }else if (f2.pw.value!==f2.pw2.value){
        alert("패스워드가 일치하지 않습니다.");
        document.f2.pw.focus();
        return true;
    }else{
     document.f2.submit();
    }
   }
   
   function mone(){
    if(f2.mail_3.value=="direct1"){
     document.f2.mail_2.focus()
     document.f2.mail_2.value=""
     f2.mail_2.readOnly = false;
     return true;
    }else{
     f2.mail_2.value=document.f2.mail_3.value
     f2.mail_2.readOnly = true;
     return false;
    }
   }
   
   function nextgo(){
    if(f2.num2.value.length>=4){
     document.f2.num3.focus();
    }
   }   
  </SCRIPT>
  <style type="text/css">
div {
	text-align: center;
}
.main {
	text-align: left;
}
table{
width: 98%;
height: 100%;
margin-left:10px;
margin-top: 10px;

}
a{
text-decoration: none;
color: black;
}

table td{
border-bottom: 1px #ccc dotted;

}
table th{
border-top: 2px red solid;
border-bottom: 2px red solid;
}

.path{
margin-top: 10px;
text-align:right;
font-size: 11px;
text-decoration: none;
font-weight: bold;
color:black;
}
.path a{
text-decoration: none;
}
.upImg img{
width: 98%;
margin: 10px;
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
		.path{
	display: none;
	}
}

</style>
  
</head>
<body leftmargin="20" onload="f2.id.focus();">
<div class="container">
		<jsp:include page="/template/header.jsp"></jsp:include>
		<jsp:include page="/template/menu.jsp"></jsp:include>

		<div class="content row">
			<div class="grid2 side">
				<jsp:include page="/template/sidemenu.jsp"></jsp:include>
			</div>
			<div class="main">
		<div class="path">
			<p><a href="./main">HOME</a> > <a href="./mypage">마이페이지</a> > 개인정보수정</p>
			</div>
			<div class="upImg">
			<img alt="update" src="./imgs/update.png">
			</div>
<FORM name="f2" action="userUp.do">
  <TABLE>
  <TR>
   <TD align=right> 아이디 &nbsp; </TD>
   <TD> <INPUT type="text" size="10" name="id" value="${bean.id }" readonly="readonly">
  </TR>

  <TR>
   <TD align=right> 이름 &nbsp; </TD>
   <TD>
	<INPUT type="text" size="10" name="name" onkeypress="space();" value="${bean.name }"/>
	<SELECT name="lv">
        <OPTION value="1" <c:if test="${bean.lv == 1 }">selected="selected"</c:if>> 학생 </OPTION>
        <OPTION value="2" <c:if test="${bean.lv == 2 }">selected="selected"</c:if>> 강사 </OPTION>
        <OPTION value="3" <c:if test="${bean.lv == 3 }">selected="selected"</c:if>> 영업 </OPTION>
        <OPTION value="4" <c:if test="${bean.lv == 4 }">selected="selected"</c:if>> 행정 </OPTION>
	</SELECT>
   </TD>
  </TR>

  <TR>
   <TD align="right"> 비밀번호 &nbsp; </TD>
   <TD> <INPUT type="password" size="10" name="pw"> <BR> </TD>
  </TR>

  <TR>
   <TD align="right"> 비밀번호확인 &nbsp; </TD>
   <TD> <INPUT type="password" size="10" name="pw2"> <BR> </TD>
  </TR>

  <TR>
   <TD align="right"> 이메일 &nbsp; </TD>
   <TD> <INPUT type="text" size="10" name="mail_1" value="${mail[0] }"> @ <INPUT type="text" size="10" name="mail_2" value="${mail[1] }">
   <SELECT name="mail_3" onChange="mone();" >
    <OPTION value="direct1"> 직접입역 </OPTION>
    <OPTION value="gmail.com" <c:if test="${mail[1] == 'gmail.com' }">selected="selected"</c:if>> 구글 </OPTION>
    <OPTION value="naver.com" <c:if test="${mail[1] == 'naver.com' }">selected="selected"</c:if>> 네이버 </OPTION>
    <OPTION value="nate.net" <c:if test="${mail[1] == 'nate.net' }">selected="selected"</c:if>> 네이트 </OPTION>
   </SELECT> <BR> </TD>
  </TR>

  <TR>
   <TD align="right"> 전화번호 &nbsp;  </TD> 
   <TD>
   <SELECT name="fistbon">
    <OPTION value="010">010</OPTION>
    <OPTION value="011">011</OPTION>
    <OPTION value="016">016</OPTION>
    <OPTION value="019">019</OPTION>
   </SELECT>
    - <INPUT type="text" size="5" name="num2" value="${phone[1] }" onkeypress="sutja();" onkeyup="nextgo()" maxlength ="4"> - <INPUT type="text" size="5" name="num3" value="${phone[2] }" onkeypress="sutja();" maxlength ="4"> <BR>
   </TD>
  </TR>

  <TR>
   <TD align="right" rowspan="2"> 주소 &nbsp; </TD>
   <TD>
   <INPUT type="text" size="5" name="post1" value="${address[0] }"> - <INPUT type="text" size="5" name="post2" value="${address[1] }">
   <INPUT type="button" value="주소 검색" name="jusos" onclick="window.open('login/juso.html','주소검색','width=550 height=150 menubar=no resizeable=no')"> <BR>
   </TD>
  </TR>

  <TR>
   <TD>
   <INPUT type="text" size="28" name="juso1" value="${address[2] }"/> <INPUT type="text" size="28" name="juso2" value="${address[3] }"/> <BR/>
   </TD>
  </TR>
  <TR>
   <TD align=center colspan="2">
   <INPUT type="button" value="수정" size="10" onclick="sujang();">
   <INPUT type="reset" value="취소" size="10">
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
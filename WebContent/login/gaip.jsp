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
$(document).ready(function(){
	$('.main').addClass("grid12");//main부분의 그리드 잡기
});
</script>
<style type="text/css">
div {
	text-align: center;
}

.main {
	text-align: left;
}
a{
text-decoration: none;
color: black;
}
table td{
border-bottom: 1px #ccc dotted;

}
.joinimg{
width: 100%;
}
.joinimg>img{
width: 90%;
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
<script type="text/javascript">

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
    
   function join(){
    if(f2.id.value==""){
     alert("아이디를 입력하세요");
     document.f2.id.focus();
    }else if(f2.id.value.length<4){
     alert("아이디를 4글자 이상 입력해주세요.");
     document.f2.id.focus();
     return true;
    }else if(f2.id.readOnly == false){
     alert("중복확인을 해주세요.");
    }else if(f2.name.value==""){
     alert("이름을 입력하세요");
     document.f2.name.focus();
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
   
   function idcheck(){
    if(f2.id.value.length<4){
     alert("아이디를 4글자 이상 입력하세요.")
     document.f2.id.focus()
     return true;
    }else{
     ID = document.f2.id.value
     window.open('login/idcheck.jsp?ID='+ID, 'idcheck', 'width=300, height=150');
     return false;
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
</script>
</head>
<body leftmargin="20" onload="f2.id.focus();">
	<div class="container">
		<jsp:include page="/template/header.jsp"></jsp:include>
		<jsp:include page="/template/menu.jsp"></jsp:include>

		<div class="content row">
		<div class="main">
		<div class="joinimg">
		<img alt="join" src="./imgs/join.png">
            </div>
            <FORM name="f2" action="./userinsert.do">

              <TABLE width="100%">
              <TR>
               <TD align=right> 아이디 &nbsp; </TD>
               <TD> <INPUT type="text" size="10" name="id" onkeypress="space();" .readOnly = false/> <INPUT type="button" value="중복확인" onclick="idcheck();"/> <BR/> </TD>
              </TR>

              <TR>
               <TD align=right> 이름 &nbsp; </TD>
               <TD>
                <INPUT type="text" size="10" name="name" onkeypress="space();"/>
                <SELECT name="lv">
                    <OPTION value="1"> 학생 </OPTION>
                    <OPTION value="2"> 강사 </OPTION>
                    <OPTION value="3"> 영업 </OPTION>
                    <OPTION value="4"> 행정 </OPTION>
                </SELECT>
               </TD>
              </TR>

              <TR>
               <TD align=right> 비밀번호 &nbsp; </TD>
               <TD> <INPUT type="password" size="10" name="pw"/> <BR/> </TD>
              </TR>

              <TR>
               <TD align=right> 비밀번호확인 &nbsp; </TD>
               <TD> <INPUT type="password" size="10" name="pw2"/> <BR/> </TD>
              </TR>

              <TR>
               <TD align=right> 이메일 &nbsp; </TD>
               <TD> <INPUT type="text" size="10" name="mail_1"/> @ <INPUT type="text" size="10" name="mail_2"/>
                   <SELECT name="mail_3" onChange="mone();">
                    <OPTION value="direct1"> 직접입역 </OPTION>
                    <OPTION value="gmail.com"> 구글 </OPTION>
                    <OPTION value="naver.com"> 네이버 </OPTION>
                    <OPTION value="nate.net"> 네이트 </OPTION>
                   </SELECT> <BR/>
               </TD>
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
                - <INPUT type="text" size="5" name="num2" onkeypress="sutja();" onkeyup="nextgo()" maxlength ="4"/> - <INPUT type="text" size="5" name="num3" onkeypress="sutja();" maxlength ="4"/> <BR/>
               </TD>
              </TR>

              <TR>
               <TD align="right" rowspan="2"> 주소 &nbsp; </TD>
               <TD>
               <INPUT type="text" size="5" name="post1"/> - <INPUT type="text" size="5" name="post2"/>
               <INPUT type="button" value="주소 검색" name="jusos" onclick="window.open('login/juso.html','주소검색','width=550 height=150 menubar=no resizeable=no')"/> <BR/>
               </TD>
              </TR>

              <TR>
               <TD>
               <INPUT type="text" size="28" name="juso1"/> <INPUT type="text" size="28" name="juso2"/> <BR/>
               </TD>
              </TR>
              <TR>
               <TD align="center" colspan="2">
               <INPUT type="button" value="가입하기" size="10" onclick="join();"/>
               <INPUT type="reset" value="취소" size="10"/>
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
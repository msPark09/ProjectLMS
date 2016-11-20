<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<SCRIPT type="text/javascript"">
    function space()
    {
      if (event.keyCode==32)
     {                             
      event.returnValue=false;
     }
    }

    function search()
    {
     if (jf1.juso.value=="")
     {
      alert("찾고자 하는 주소를 입력해주세요.");
      document.jf1.juso.focus();
     }
     else
     {
      document.jf1.submit()
     }
    }

    function search_ok()
    {
     var str1 = document.jf2.post_ok.value;
     var str2 = str1.substr(0, 3);
     var str3 = str1.substr(4, 3);
     var str4 = str1.substr(8, 100);
     opener.document.f2.post1.value = str2;
     opener.document.f2.post2.value = str3;
     opener.document.f2.juso1.value = str4;
     opener.document.f2.juso2.focus();
     opener.f2.post1.readOnly = true;
     opener.f2.post2.readOnly = true;
     opener.f2.juso1.readOnly = true;
     window.close();
    }  
   </SCRIPT>
</head>
<body>
<form name="jf2" action="juso1.jsp">
 <%
 	String tmp = "%"+request.getParameter("juso")+"%";

    Connection conn=null;
 	PreparedStatement pstmt;
 	ResultSet rs;  
   	
 	String driver = "oracle.jdbc.driver.OracleDriver";
 	String url = "jdbc:oracle:thin:@localhost:1521:xe";
 	String user = "scott";
 	String password = "tiger";
  
  	String sql = "Select count(*) As imsi From POST Where ADDR Like ?";
   	
  	System.out.println("확인");
  	
  	int count=0;
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, user, password);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, tmp);
		rs = pstmt.executeQuery();
		if(rs.next()){
			count = rs.getInt("imsi");
		}
		if(rs!=null)rs.close();
		if(pstmt!=null)pstmt.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	if(count==0){
 %>
  <script type="text/javascript">
   alert("검색결과가 없습니다.")
   history.go(-1);
  </script>
 <%
	}else{
 %>
 <center>
  <table border='0'>
   <tr>
    <td align="center">주소 선택 후 확인 버튼을 눌러주세요.</td>
   </tr>
 
   <tr>
    <td align="center">
   <select name="post_ok">
 <%
 	String boja = "Select PST1, PST2, ADDR1, ADDR2, ADDR3, ADDR From POST Where ADDR Like ?";
 	pstmt = conn.prepareStatement(boja);
	pstmt.setString(1, tmp);
	rs = pstmt.executeQuery();
  while(rs.next()){
  	String db_post = rs.getString("PST1")+"-"+rs.getString("PST2")+" "+rs.getString("ADDR1")+" "+rs.getString("ADDR2")+" "+rs.getString("ADDR3");
  	String db_post_value = rs.getString("PST1")+"-"+rs.getString("PST2")+" "+rs.getString("ADDR");
 %>
  <option value="<%=db_post_value%>"><%=db_post%></option>
 <%
  }
 %>
  </select>
    </td>
    <td align="center"><input type="button" value=" 확 인 " onclick="search_ok();"></td>
   </tr>
  </table>
  </center>
<%
	}
%>   
 </form> 
</body>
</html>
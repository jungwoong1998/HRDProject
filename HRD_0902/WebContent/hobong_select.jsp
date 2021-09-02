<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호봉정보 조회</title>
<style type="text/css">
#select_t{margin: 0 auto; width: 500px; height: 250px;}
h1{text-align: center; font-family: 'HY견고딕';}
</style>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<br/>
<h1>호봉 정보 조회</h1><hr/>
<table border="2" id="select_t">
<tr>
<th>no</th> <th>등급</th> <th>급여</th>
</tr>
<%
PreparedStatement pstmt = null;
ResultSet rs = null;
int no=0;

try{
	String sql = "select * from hobong0902";
	pstmt = conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	while(rs.next()){
		String dunggub = rs.getString(1);
		if(dunggub.equals("10")){
			dunggub = "1급";
		}else if(dunggub.equals("20")){
			dunggub = "2급";
		}else if(dunggub.equals("30")){
			dunggub = "3급";
		}else if(dunggub.equals("40")){
			dunggub = "4급";
		}else if(dunggub.equals("50")){
			dunggub = "5급";
		}
		String salary = rs.getString(2);
		no++;
		%>
		<tr>
		<td><%=no %></td>
		<td><a href="hobong_update.jsp?dunggub=<%=rs.getString(1)%>" style="color: blue;"><%=dunggub %></a></td>
		<td><%=salary %></td>
		</tr>
		<%
	}
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
</table><hr/>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
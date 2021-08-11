<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호봉정보 조회</title>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="dbconn.jsp" %>
<h1>호봉 정보 조회</h1><hr>
<table border="1" id="t4">
<tr>
<th>no</th> <th>등급</th> <th>급여</th> 
</tr>
<%
PreparedStatement pstmt = null;
ResultSet rs= null;

int no =0;
String sql = "select count(*) from hobong0809";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

try{
sql = "select * from hobong0809";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

while(rs.next()){
	
	String dunggub = rs.getString(1);
	if(dunggub.equals("1")){
		dunggub = "1급";
	}else if(dunggub.equals("2")){
		dunggub = "2급";
	}else if(dunggub.equals("3")){
		dunggub = "3급";
	}else if(dunggub.equals("4")){
		dunggub = "4급";
	}else if(dunggub.equals("5")){
		dunggub = "5급";
	}
	String salary = rs.getString(2);
	no++;
	%>
	<tr>
	<td><%=no %></td>
	<td><%=dunggub %></td>
	<td><%=salary %></td>
	
	<%
	
}
}catch(SQLException e){
	e.printStackTrace();
}
%>

</table><hr>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
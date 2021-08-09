<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인사관리 사원정보 조회</title>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="dbconn.jsp" %>
<h1>사원 정보 조회</h1><hr>
<table border="1" id="t2">
<tr>
<th>no</th> <th>사번</th> <th>성명</th> <th>직급</th> 
<th>직책</th> <th>연락처</th> <th>소속부서</th> <th>주소</th> 
</tr>
<%
PreparedStatement pstmt = null;
ResultSet rs= null;

int no =0;
String sql = "select count(*) from info0809";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

try{
sql = "select * from info0809";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

while(rs.next()){
	
	String id = rs.getString(1);
	String name = rs.getString(2);
	String position = rs.getString(3);
	String dept = rs.getString(4);
	if(dept.equals("10")){
		dept = "인사부";
	}else if(dept.equals("20")){
		dept = "기획부";
	}else if(dept.equals("30")){
		dept = ""
	}
	String duty = rs.getString(5);
	String phone = rs.getString(6);
	String address = rs.getString(7);
	no++;
	%>
	<tr>
	<td><%=no %></td>
	<td><%=id %></td>
	<td><%=name %></td>
	<td><%=dept %></td>
	<td><%=position %></td>
	<td><%=duty %></td>
	<td><%=phone %></td>
	<td><%=address %></td>
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
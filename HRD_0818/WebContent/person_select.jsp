<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직원정보조회</title>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<h2>직원 정보</h2><br><hr>
<table border="3" id="person_select">

<tr>
<th>no</th> <th>성명</th> <th>사번</th> <th>직급</th> 
<th>직책</th> <th>연락처</th> <th>소속부서</th>
</tr>
<%
PreparedStatement pstmt=null;
ResultSet rs=null;
int no=0;

String sql="select * from person0818";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();

	while(rs.next()){
		String id=rs.getString(1);
		String name=rs.getString(2);
		String dept=rs.getString(3);
		String position=rs.getString(4);
		String duty=rs.getString(5);
		String phone=rs.getString(6);
		no++;
	
%>
	<tr>
	<td class="person_table"><%=no %></td>
	<td class="person_table"><%=name %></td>
	<td class="person_table"><a href="update_person.jsp?id=<%=id %>"><%=id %></a></td>
	<td class="person_table"><%=position %></td>
	<td class="person_table"><%=duty %></td>
	<td class="person_table"><%=phone %></td>
	<td class="person_table"><%=dept %></td>
	</tr>
<%
	}
%>
</table><hr>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
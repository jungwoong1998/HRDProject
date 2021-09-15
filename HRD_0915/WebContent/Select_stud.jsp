<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학사정보 조회</title>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<br/>
<h2 style="font-family: sans-serif;" align="center">학사 정보 목록</h2><br/>
<%
PreparedStatement pstmt=null;
ResultSet rs = null;
int id=0;

String sql = "select count(*) from stud0915";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();

if(rs.next()){
	id=rs.getInt(1);
}
%>
<p>총 <%=id %>명의 학사정보가 있습니다.</p><hr/>
<table border="3" id="forn" style="margin: 0 auto; width: 1200px; height: 200px;">
<tr>
<th>학번</th> <th>성명</th> <th>학과</th> <th>학년</th> <th>주소</th> <th>연락처</th>
</tr>
<%
pstmt=null;
rs=null;

sql="select * from stud0915 order by studNo asc";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();

while(rs.next()){
	String studNo = rs.getString(1);
	String name = rs.getString(2);
	String dept = rs.getString(3);
	String position = rs.getString(4);
	String address = rs.getString(5);
	String phone = rs.getString(6);
	%>
	<tr>
	<td align="center"><%=studNo %></td>
	<td align="center"><%=name %></td>
	<td align="center"><%=dept %></td>
	<td align="center"><%=position %></td>
	<td align="center"><%=address %></td>
	<td align="center"><%=phone %></td>
	</tr>
	<%
}
%>
</table>
<a href="Insert_stud.jsp"><button style="position: relative; top: 5px; left: 50%; width: 120px; height: 30px; background-color: black; color: white;">학사정보 추가</button></a>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
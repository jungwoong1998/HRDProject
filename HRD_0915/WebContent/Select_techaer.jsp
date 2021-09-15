<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강사 목록</title>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<br/>
<h2 style="font-family: sans-serif;" align="center">강사 목록</h2><br/>
<%
PreparedStatement pstmt=null;
ResultSet rs = null;
int num=0;

String sql = "select count(*) from teacher0915";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();

if(rs.next()){
	num=rs.getInt(1);
}
%>
<p>총 <%=num %>명의 강사가 있습니다.</p><hr/>
<table border="3" id="forn" style="margin: 0 auto; width: 1200px; height: 200px;">
<tr>
<th>강사코드</th> <th>강사명</th> <th>전공</th> <th>세부전공</th> <th>관리</th>
</tr>
<%
pstmt=null;
rs=null;

sql="select * from teacher0915";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();

while(rs.next()){
	String idx = rs.getString(1);
	String name = rs.getString(2);
	String major = rs.getString(3);
	String field = rs.getString(4);
	%>
	<tr>
	<td align="center"><%=idx %></td>
	<td align="center"><%=name %></td>
	<td align="center"><%=major %></td>
	<td align="center"><%=field %></td>
	<td align="center"><a href="Update_techaer.jsp?idx=<%=idx%>">수정</a> / <a href="Delete_techaer.jsp?idx=<%=idx%>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</td>

	</tr>
	<%
}
%>
</table>
<a href="Insert_techaer.jsp"><button style="position: relative; top: 5px; left: 50%; width: 120px; height: 30px; background-color: black; color: white;">작성</button></a>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>급여 정보 조회</title>
</head>
<body>
<header><%@include file = "header.jsp" %></header>
<nav><%@include file = "nav.jsp" %></nav>
<section>
<h1>급여 정보 조회</h1>
<%@include file = "dbconn.jsp" %>
<table border="2" id="t6"><hr>
<tr>
<th>no</th> <th>사원번호</th> <th>이름</th> <th>급여</th> <th>가족수당</th>
<th>직책수당</th> <th>근속수당</th> <th>기타수당</th> <th>수당합계</th>
<th>구분</th>
</tr>
<% 
PreparedStatement pstmt = null;
ResultSet rs = null;
int no=0;
try{
	String sql = "select c.id,a.name,to_char(b.salary,'999,999,999'),to_char(c.gajok,'999,999'),to_char(c.jikchak,'999,999'),to_char(c.gunsok,'999,999'),to_char(c.gitasudang,'999,999') ,to_char((b.salary+c.gajok+c.jikchak+c.gunsok+c.gitasudang),'999,999,999') from info0809 a,hobong0809 b,sudnag0809 c where a.id=c.id and a.position=b.dunggub";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	while(rs.next()){
		String id = rs.getString(1);
		String name = rs.getString(2);
		String salary = rs.getString(3);
		String gajok = rs.getString(4);
		String jikchak = rs.getString(5);
		String gunsok = rs.getString(6);
		String gitasudang = rs.getString(7);
	    String sum= rs.getString(8);
		no++;
		%>
		<tr>
		<td class="sum1"><%=no %></td>
		<td class="sum1"><%=id%></td>
		<td class="sum1"><%=name%></td>
		<td class="sum2"><%=salary%></td>
		<td class="sum2"><%=gajok%></td>
		<td class="sum2"><%=jikchak%></td>
		<td class="sum2"><%=gunsok %></td>
		<td class="sum2"><%=gitasudang %></td>
		<td class="sum2"><%=sum %></td>
		<td class="sum1">
		<a href="sudang_update.jsp?id=<%=id %>">수정</a> /
		<a href="sudang_delete.jsp?id=<%=id %>" onclick="if(!confirm("삭제하시겠습니까?"))return false;">삭제</a>
		</td>
		</tr>
		<%
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
</table><hr>
</section>
<footer><%@include file ="footer.jsp" %></footer>
</body>
</html>
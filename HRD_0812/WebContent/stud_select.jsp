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
<header><%@include file = "header.jsp" %></header>
<nav><%@include file ="nav.jsp" %></nav>
<section>
<%@include file = "dbconn.jsp" %>
<h2>학사정보 목록</h2>
<%
PreparedStatement pstmt = null;
ResultSet rs = null;
int num=0;

String sql = "select count(studNo) from stud0812";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

if(rs.next()){
	num = rs.getInt(1);
}
%>
<p>총 <%=num %>개의 교과목이 있습니다.</p><hr>
<table border="3" id="stud">
<tr class="stud1">
<th>학번</th> <th>성명</th> <th>학과</th> <th>학년</th>
<th>주소</th> <th>연락처</th>
</tr>
<%
try{
	sql = "select * from stud0812 order by studNo asc";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		String stud = rs.getString(1);
		String name = rs.getString(2);
		String dept = rs.getString(3);
		String posi = rs.getString(4);
		String addr = rs.getString(5);
		String phone = rs.getString(6);
		%>
		<tr>
		<td class="stud2"><%=stud %></td>
		<td class="stud2"><%=name %></td>
		<td class="stud2"><%=dept %></td>
		<td class="stud2"><%=posi %></td>
		<td class="stud2"><%=addr %></td>
		<td class="stud2"><%=phone %></td>
		</tr>
		<%
	}
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
<a href="stud_insert.jsp"><button id="stu" class="btn">학사정보 추가</button></a>
</table>
</section>
<footer><%@include file = "footer.jsp" %></footer>
</body>
</html>
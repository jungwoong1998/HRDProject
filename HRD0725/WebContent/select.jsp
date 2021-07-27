<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직원정보 조회</title>
<style type="text/css">
h2{
text-align: center;
line-height: 60px;
}
#t{
height: 50%;
width: 800px;
margin: 0 auto;
}
.t{
text-align: center;
}
</style>
</head>
<body>
<header><%@include file = "header.jsp" %></header>
<nav><%@include file = "nav.jsp" %></nav>
<section>
<%@include file = "dbconn.jsp" %>
<h2>직원 정보 조회</h2><hr>
<table border="1" id="t">
<tr>
<th>no</th> <th>성명</th> <th>사번</th>
<th>직급</th> <th>직책</th> <th>연락처</th> <th>소속부서</th>
</tr>
<%
int no = 0;
PreparedStatement pstmt = null;
ResultSet rs = null;
request.setCharacterEncoding("utf-8");

String sql = "select count(*) from insa0725";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();

try{
	sql="select * from insa0725";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String name = rs.getString(2);
		String id = rs.getString(1);
		String position = rs.getString(4);
		String duty = rs.getString(5);
		String phone = rs.getString(6);
		String dept = rs.getString(3);
		no++;
		%>
		<tr>
		<td class="t"><%=no %></td>
		<td class="t"><%=name %></td>
		<td class="t"><%=id %></td>
		<td class="t"><%=position %></td>
		<td class="t"><%=duty %></td>
		<td class="t"><%=phone %></td>
		<td class="t"><%=dept %></td>
		<%
	}
	
	System.out.println("조회성공");
}catch(SQLException e){
	System.out.println("조회 실패");
	e.printStackTrace();
}
%>
</tr>
</table><hr>
</section>
<footer><%@include file = "footer.jsp" %></footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강사 정보 조회</title>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<br/><h2>강사 목록</h2>
<%
PreparedStatement pstmt=null;
ResultSet rs = null;
int num=0;

String sql="select count(*) from lecturer0923";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();

if(rs.next()){
	num=rs.getInt(1);
}
%>
<p>총 <%=num %>명의 강사가 있습니다.</p><hr/>
<table border="3" id="tbn_select">
<tr>
<th>강사코드</th> <th>강사명</th> <th>전공</th> <th>세부전공</th> <th>관리</th>
</tr>
<%
pstmt=null;
rs=null;
try{
	sql="select * from lecturer0923 order by idx asc";
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
		<td align="center"><a href="update_lecturer.jsp?idx=<%=idx%>">수정</a> / 
		 <a href="delete_lecturer.jsp?idx=<%=idx%>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a> </td>
		</tr>
		<%
	}
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
</table>
<a href=""><button style="position: relative; top: 5%; left: 48%; background-color: gray; height: 30px; width: 100px; color: white;">작성</button></a>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
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
<br/><h2>학사정보 목록</h2>
<%
PreparedStatement pstmt=null;
ResultSet rs = null;
int num=0;

String sql="select count(*) from stud0923";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();

if(rs.next()){
	num=rs.getInt(1);
}
%>
<p>총 <%=num %>명의 학사정보가 있습니다.</p><hr/>
<table border="3" id="tbn_select">
<tr>
<th>학번</th> <th>성명</th> <th>학과</th> <th>학년</th> <th>주소</th> <th>연락처</th> <th>취미</th> <th>관리</th>
</tr>
<%
pstmt=null;
rs=null;
try{
	sql="select * from stud0923 order by studno asc";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	while(rs.next()){
		String studno = rs.getString(1);
		String name = rs.getString(2);
		String dept = rs.getString(3);
		String position = rs.getString(4);
		String address = rs.getString(5);
		String phone = rs.getString(6);
		String hobby = rs.getString(7);
		%>
		<tr>
		<td align="center"><%=studno %></td>
		<td align="center"><%=name %></td>
		<td align="center"><%=dept %></td>
		<td align="center"><%=position %></td>
		<td align="center"><%=address %></td>
		<td align="center"><%=phone %></td>
		<td align="center"><%=hobby %></td>
		<td align="center"><a href="update_stud.jsp?studno=<%=studno%>">수정</a> / 
		 <a href="delete_stud.jsp?studno=<%=studno%>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a> </td>
		</tr>
		<%
	}
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
</table>
<a href="insert_stud.jsp"><button style="position: relative; top: 5%; left: 48%; background-color: gray; height: 30px; width: 100px; color: white;">학사정보 추가</button></a>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
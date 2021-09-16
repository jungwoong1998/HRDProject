<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록</title>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<h2>회원 목록</h2>
<%
PreparedStatement pstmt=null;
ResultSet rs =null;
int num=0;

String sql = "select count(*)from member0914";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();

if(rs.next()){
	num = rs.getInt(1);
}
%>
<p>총 <%=num %>명의 회원이 있습니다.<hr/>
<table border="3" style="margin: 0 auto; width: 1200px;">
<tr class="ta">
<th>아이디</th> <th>성 명</th> <th>비밀번호</th> <th>성별</th> <th>생년월일</th> 
<th>이메일</th> <th>연락처</th> <th>주소</th> <th>입력일</th> <th>구분</th>
</tr>
<%
pstmt=null;
rs=null;

try{
	sql="select id,password,name,gender,birth,mail,phone,address,to_char(titmestamp,'yyyy-mm-dd') from member0914";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	while(rs.next()){
		String id = rs.getString(1);
		String password = rs.getString(2);
		String name = rs.getString(3);
		String gender = rs.getString(4);
		String birth = rs.getString(5);
		String mail = rs.getString(6);
		String phone = rs.getString(7);
		String address = rs.getString(8);
		String titmestamp = rs.getString(9);
		%>
		<tr>
		<td align="center"><%=id %></td>
		<td align="center"><%=name %></td>
		<td align="center"><%=password %></td>
		<td align="center"><%=gender %></td>
		<td align="center"><%=birth %></td>
		<td align="center"><%=mail %></td>
		<td align="center"><%=phone %></td>
		<td align="center"><%=address %></td>
		<td align="center"><%=titmestamp %></td>
		<td align="center"><a href="updateMember.jsp?id=<%=id %>">수정</a>
		/ <a href="deleteMember.jsp?id=<%=id %>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a></td>
		<%
	}
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
</table>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
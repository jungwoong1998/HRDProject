<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main화면</title>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<h2>회원 정보 조회</h2><br/>
<table border="1" id="select_m1">

<tr>
<th>id</th> <th>성명</th> <th>패스워드</th> <th>성별</th> <th>생년월일</th> <th>이메일</th> <th>휴대폰</th> <th>주 소</th> <th>닉네임</th>
</tr>

<%
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	String sql = "select id,password,name,gender,to_char(birth,'yyyy-mm-dd'),mail,phone,address,nickname from member0908";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		String id = rs.getString(1);
		String password = rs.getString(2);
		String name = rs.getString(3);
		String gender = rs.getString(4);
		String birth = rs.getString(5);
		String phone = rs.getString(7);
		String address = rs.getString(8);
		String nickname = rs.getString(9);
		String mail = rs.getString(6);
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
		<td align="center"><%=nickname %></td>
		</tr>
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
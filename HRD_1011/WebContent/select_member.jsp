<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 조회</title>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<h2>회원 정보 조회</h2><br/>
<%@include file="DBconn.jsp" %>
<table border="1" id="t2">
<tr>
<th>id</th> <th>성명</th> <th>패스워드</th> <th>성별</th> <th>생년월일</th> <th>이메일</th> <th>휴대폰</th> <th>주소</th> <th>닉네임</th>
</tr>
<%
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	String sql = "select id,name,password,gender,to_char(birth,'yy-mm-dd'),mail,phone,address,nickname from member1011";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		String id = rs.getString(1);
		String name = rs.getString(2);
		String password = rs.getString(3);
		String gender = rs.getString(4);
		String birth = rs.getString(5);
		String mail = rs.getString(6);
		String phone = rs.getString(7);
		String address = rs.getString(8);
		String nickname = rs.getString(9);
		%>
		<tr>
		<td class="in1"><%=id %></td>
		<td class="in1"><%=name %></td>
		<td class="in1"><%=password %></td>
		<td class="in1"><%=gender %></td>
		<td class="in1"><%=birth %></td>
		<td class="in1"><%=mail %></td>
		<td class="in1"><%=phone %></td>
		<td class="in1"><%=address %></td>
		<td class="in1"><%=nickname %></td>
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
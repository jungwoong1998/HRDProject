<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "java.sql.*" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member_select&update</title>
</head>
<body>
<header><%@include file = "header.jsp" %></header>
<nav><%@include file = "nav.jsp" %></nav>
<section>
<%@include file = "DBconn.jsp" %>
<br/>
<h1>회원목록조회/수정</h2><br/>
<table border="1" id="table_b">

<tr>
<th>회원번호</th> <th>회원성명</th> <th>전화번호</th> <th>주소</th> <th>가입일자</th> <th>고객등급</th> <th>거주지역</th>
</tr>

<%
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	String sql = "select custno,custname,phone,address,to_char(joindate,'yyyy-mm-dd'),grade,city  from member0913";
	pstmt =conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		String custno = rs.getString(1);
		String custname = rs.getString(2);
		String phone = rs.getString(3);
		String address = rs.getString(4);
		String joindate = rs.getString(5);
		String grade = rs.getString(6);
		if(grade.equals("A")){
			grade = "VIP";
		}else if(grade.equals("B")){
			grade = "일반";
		}else  if(grade.equals("C")){
			grade = "직원";
		}
		String city = rs.getString(7);
		%>
		<tr>
		<td align="center"><a href="update_member.jsp?custno=<%=custno %>"><%=custno %></a></td>
		<td align="center"><%=custname %></td>
		<td align="center"><%=phone %></td>
		<td align="center"><%=address %></td>
		<td align="center"><%=joindate %></td>
		<td align="center"><%=grade %></td>
		<td align="center"><%=city %></td>
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
<footer><%@include file = "footer.jsp" %></footer>
</body>
</html>
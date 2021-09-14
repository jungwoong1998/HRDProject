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
<h1>회원매출조회</h2><br/>
<table border="1" id="table_a">

<tr>
<th>회원번호</th> <th>회원성명</th> <th>고객등급</th> <th>매출</th>
</tr>

<%
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	String sql = "select a.custno,a.custname,a.grade,sum(b.price) from member0913 a,money0913 b where a.custno=b.custno group by a.custno,a.custname,a.grade order by a.custno asc";
	pstmt =conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		String custno = rs.getString(1);
		String custname = rs.getString(2);
		String grade = rs.getString(3);
		if(grade.equals("A")){
			grade = "VIP";
		}else if(grade.equals("B")){
			grade = "일반";
		}else if(grade.equals("C")){
			grade = "직원";
		}
		String price = rs.getString(4);
		%>
		<tr>
		<td align="center"><%=custno %></td>
		<td align="center"><%=custname %></td>
		<td align="center"><%=grade %></td>
		<td align="center"><%=price %></td>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품정보 조회</title>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<h2>상품 정보 조회</h2><br/>
<%@include file="DBconn.jsp" %>
<table border="1" id="t2">
<tr>
<th>no</th> <th>상품코드</th> <th>상품명</th> <th>가격</th> <th>상세정보</th> <th>분류</th> <th>제조사</th> <th>재고수</th> <th>상태</th>
</tr>
<%
PreparedStatement pstmt = null;
ResultSet rs = null;
int no=0;

try{
	String sql = "select * from product1011";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		String PRODUCTID = rs.getString(1);
		String PRODUCTNAME = rs.getString(2);
		String UNITPRICE = rs.getString(3);
		String DESCRIPTION = rs.getString(4);
		String CATEGORY = rs.getString(5);
		String MANUFACTURER = rs.getString(6);
		String UNITSINSTOCK = rs.getString(7);
		String CONDITION = rs.getString(8);
		no++;
		%>
		<tr>
		<td class="in1"><%=no %></td>
		<td class="in1"><%=PRODUCTID %></td>
		<td class="in1"><%=PRODUCTNAME %></td>
		<td class="in1"><%=UNITPRICE %></td>
		<td class="in1"><%=DESCRIPTION %></td>
		<td class="in1"><%=CATEGORY %></td>
		<td class="in1"><%=MANUFACTURER %></td>
		<td class="in1"><%=UNITSINSTOCK %></td>
		<td class="in1"><%=CONDITION %></td>
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
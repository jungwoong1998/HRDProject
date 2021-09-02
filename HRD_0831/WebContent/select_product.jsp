<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품정보 조회</title>
<style>
h3{text-align: center;}
#select_t{margin: 0 auto; width: 1000px;}
</style>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<h3>상품 정보 조회</h3><br/>
<table border="1" id="select_t">
<tr>
<th>no</th> <th>상품코드</th> <th>상품명</th> <th>가격</th> <th>상세정보</th> <th>분류</th> <th>제조사</th> <th>재고수</th> <th>상태</th>
</tr>
<%
PreparedStatement pstmt=null;
ResultSet rs = null;
int no=0;
try{
	String sql = "select * from product0831";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	while(rs.next()){
		String productId = rs.getString(1);
		String productName = rs.getString(2);
		String unitprice = rs.getString(3);
		String description = rs.getString(4);
		String category = rs.getString(5);
		String manufacturer = rs.getString(6);
		String unitsInstock = rs.getString(7);
		String condition = rs.getString(8);
		no++;
		%>
		<tr>
		<td align="center"><%=no %></td>
		<td align="center"><%=productId %></td>
		<td align="center"><%=productName %></td>
		<td align="center"><%=unitprice %></td>
		<td align="center"><%=description %></td>
		<td align="center"><%=category %></td>
		<td align="center"><%=manufacturer %></td>
		<td align="center"><%=unitsInstock %></td>
		<td align="center"><%=condition %></td>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 목록 조회</title>
<style>
#t{
margin: 0 auto;
width: 1200px;
height: 70%;
}
.t{
text-align: center;
}
p{
padding-left: 2%;
}
#bw{
position: relative;
left: 750px;
top: 20px;
height: 30px;
width: 100px;
background-color: #A4A4A4;
color: white;
}
table tr td a:VISITED {
	color: blue;
}
</style>
</head>
<body>
<header><%@include file = "header.jsp" %></header>
<nav><%@include file = "nav.jsp" %></nav>
<section>
<%@include file = "dbconn.jsp" %>
<h2>상품 목록</h2>
<%
PreparedStatement pstmt = null;
ResultSet rs = null;

int mun = 0;
String sql = "select count(*) from product0802";
pstmt = conn.prepareStatement(sql);
rs=pstmt.executeQuery();

if(rs.next()){
	mun = rs.getInt(1);
}
%>
<p>총 <%=mun %>개의 상품이 있습니다.</p><hr>
<table border="1" id="t">
<tr>
<th>상품코드</th><th>상품분류</th><th>작성자 이름</th><th>상품이름</th><th>제조사 이름</th>
<th>시중가격</th><th>판매가격</th><th>날짜</th><th>재고량</th><th>메모</th>
<th>구분</th>
</tr>
<%
try{
	sql = "select * from product0802";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		String id = rs.getString(1);
		String category = rs.getString(2);
		String wname = rs.getString(3);
		String pname = rs.getString(4);
		String sname = rs.getString(5);
		String price = rs.getString(6);
		String downprice = rs.getString(7);
		String inputdate = rs.getString(8);
		String stock = rs.getString(9);
		String description = rs.getString(10);
		%>
		<tr>
		<td class="t"><%=id %></td>
		<td class="t"><%=category %></td>
		<td class="t"><%=wname %></td>
		<td class="t"><%=pname %></td>
		<td class="t"><%=sname %></td>
		<td class="t"><%=price %></td>
		<td class="t"><%=downprice %></td>
		<td class="t"><%=inputdate %></td>
		<td class="t"><%=stock %></td>
		<td class="t"><%=description %></td>
		<td class="t">
		<a href="product_update.jsp?id=<%=id %>">수정</a> / 
		<a href="product_delete.jsp?id=<%=id %>" onclick="if(!confirm("정말로 삭제하시겠습니까?"))return false;">삭제</a>
		</tr>
		<%
	}
}catch(SQLException e){
	System.out.println("조회 실패");
	e.printStackTrace();
}
%>
</table>
<a href="product_insert.jsp"><button id="bw">작성</button></a>
</section>
<footer><%@include file = "footer.jsp" %></footer>
</body>
</html>
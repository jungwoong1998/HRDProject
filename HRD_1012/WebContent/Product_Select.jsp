<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 목록 조회</title>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section><%@include file="DBconn.jsp" %>
<br/><h3 style="text-align: center; font-family: sans-serif;">상품추가</h3>
<%
PreparedStatement pstmt = null;
ResultSet rs = null;
int cnt = 0;

String sql = "select count(*) from product1012";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

if(rs.next()){
	cnt = rs.getInt(1);
}
%>
<p style="padding-left: 28%;">총 <%=cnt %>개의 상품이 있습니다.</p><hr/>
<table border="2" id="t2">
<tr>
<th>상품코드</th> <th>상품분류</th> <th>작성자 이름</th> <th>상품이름</th> <th>제조사 이름</th> <th>시중가격</th> <th>판매가격</th> <th>날짜</th> <th>재고량</th> <th>메모</th> <th>구분</th>
</tr>
<%
pstmt = null;
rs = null;
try{
	sql = "select id,category,wname,pname,sname,to_char(price,'999,999'),to_char(downprice,'9999,999'),to_char(inputdate,'yyyy-mm-dd'),stock,description from product1012";
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
		<td class="in2"><%=id %></td>
		<td class="in2"><%=category %></td>
		<td class="in2"><%=wname %></td>
		<td class="in2"><%=pname %></td>
		<td class="in2"><%=sname %></td>
		<td class="in2"><%=price %></td>
		<td class="in2"><%=downprice %></td>
		<td class="in2"><%=inputdate %></td>
		<td class="in2"><%=stock %></td>
		<td class="in2"><%=description %></td>
		<td class="in2"><a href="Product_Update.jsp?id=<%=id%>">수정</a> / <a href="Product_Delect_jsp?id=<%=id%>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a></td>
		</tr>
		<%
	}
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
</table>
<a href="Product_Insert.jsp"><button id="btn1">작성</button></a>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
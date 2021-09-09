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
<h2>상품 목록</h2><br/>
<table border="1" id="select_m1">
<%
PreparedStatement pstmt=null;
ResultSet rs = null;
int num=0;

String sql = "select count(*) from order0908";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

if(rs.next()){
	num = rs.getInt(1);
}
%>
<p>총 <%=num %>개의 상품이 있습니다.</p><hr/>
<tr>
<th>상품코드</th> <th>주문자이름</th> <th>주문날짜</th> <th>배달주소</th> <th>전화번호</th> <th>결제방법</th> <th>카드번호</th> <th>주문상품수</th> <th>판매가격</th>
<th>총금액</th> <th>구분</th>
</tr>

<%
pstmt = null;
rs = null;

try{
	sql = "select a.id,a.name,a.orderdate,a.addr,a.tel,a.pay,a.cardno,a.prodcount,b.unitprice,a.total from order0908 a,product0908 b where a.id=b.producId";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		String id = rs.getString(1);
		String name = rs.getString(2);
		String orderdate = rs.getString(3);
		String addr = rs.getString(4);
		String tel = rs.getString(5);
		String pay = rs.getString(6);
		String cardno = rs.getString(7);
		String prodcount = rs.getString(8);
		String unitprice = rs.getString(9);
		String total = rs.getString(10);
		%>
		<tr>
		<td align="center"><%=id %></td>
		<td align="center"><%=name %></td>
		<td align="center"><%=orderdate %></td>
		<td align="center"><%=addr %></td>
		<td align="center"><%=tel %></td>
		<td align="center"><%=pay %></td>
		<td align="center"><%=cardno %></td>
		<td align="center"><%=prodcount %></td>
		<td align="center"><%=unitprice %></td>
		<td align="center"><%=total %></td>
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
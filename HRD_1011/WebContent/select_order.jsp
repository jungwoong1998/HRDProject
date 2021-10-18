<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문정보 조회</title>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<h2>주문 정보 조회</h2><br/>
<%
PreparedStatement pstmt = null;
ResultSet rs = null;
int cnt=0;

String sql = "select count(*) from order1011";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

if(rs.next()){
	cnt = rs.getInt(1);
}
%>
<p>총 <%=cnt %>개의 상품이 있습니다.</p>
<table border="1" id="t2">
<tr>
<th>상품코드</th> <th>주문자이름</th> <th>주문날짜</th> <th>배달주소</th> <th>전화번호</th> <th>결제방법</th> <th>카드번호</th> <th>주문상품수</th> <th>판매가격</th> <th>총금액</th> <th>구분</th>
</tr>
<%
pstmt = null;
rs = null;
int sum=0;
try{
	sql = "select a.productId,b.name,to_char(b.orderdate,'yyyy-mm-dd'),b.addr,b.tel,b.pay,b.cardno,b.prodcount,b.total from product1011 a,order1011 b where a.productId=b.id";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		String productId = rs.getString(1);
		String name = rs.getString(2);
		String orderdate = rs.getString(3);
		String addr = rs.getString(4);
		String tel = rs.getString(5);
		String pay = rs.getString(6);
		String cardno = rs.getString(7);
		String prodcount = rs.getString(8);
		String total = rs.getString(9);
		sum += rs.getInt(9);
		%>
		<tr>
		<td class="in1"><%=productId %></td>
		<td class="in1"><%=name %></td>
		<td class="in1"><%=orderdate %></td>
		<td class="in1"><%=addr %></td>
		<td class="in1"><%=tel %></td>
		<td class="in1"><%=pay %></td>
		<td class="in1"><%=cardno %></td>
		<td class="in1"><%=prodcount %></td>
		<td class="in1"><%=total %></td>
		<td class="in1"><%=sum %></td>
		<td class="in1"><a href="update_order.jsp?productId=<%=productId%>">수정</a> / <a href="delete_order.jsp?productId=<%=productId%>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a></td>
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
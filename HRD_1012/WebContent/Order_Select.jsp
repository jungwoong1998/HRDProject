<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문 목록</title>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section><%@include file="DBconn.jsp" %>
<br/><h3 style="text-align: center; font-family: sans-serif;">주문 목록</h3>
<%
PreparedStatement pstmt = null;
ResultSet rs = null;
int cnt = 0;

String sql = "select count(*) from order1012";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

if(rs.next()){
	cnt = rs.getInt(1);
}
%>
<p style="padding-left: 28%;">총 <%=cnt %>개의 상품이 있습니다.</p><hr/>
<table border="2" id="t2">
<tr>
<th>상품코드</th> <th>주문자이름</th> <th>주문날짜</th> <th>배달주소</th> <th>전화번호</th> <th>결제방법</th> <th>카드번호</th> <th>주문상품수</th> <th>판매가격</th> <th>총 금액</th> <th>구분</th>
</tr>
<%
pstmt = null;
rs = null;
int sum=0;
try{
	sql = "select a.id,b.name,to_char(b.orderdate,'yyyy-mm-dd'),b.addr,b.tel,b.pay,b.cardno,b.prodcount,b.total from product1012 a, order1012 b where a.id=b.id";
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
		String total = rs.getString(9);
		sum += rs.getInt(9); 
		%>
		<tr>
		<td class="in2"><%=id %></td>
		<td class="in2"><%=name %></td>
		<td class="in2"><%=orderdate %></td>
		<td class="in2"><%=addr %></td>
		<td class="in2"><%=tel %></td>
		<td class="in2"><%=pay %></td>
		<td class="in2"><%=cardno %></td>
		<td class="in2"><%=prodcount %></td>
		<td class="in2"><%=total %></td>
		<td class="in2"><%=sum %></td>
		<td class="in2"><a href="Order_Update.jsp?id=<%=id%>">수정</a> / <a href="Order_Delect_jsp?id=<%=id%>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a></td>
		</tr>
		<%
	}
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
</table>
<a href="Order_Insert.jsp"><button id="btn1">작성</button></a>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
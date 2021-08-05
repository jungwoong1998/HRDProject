<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문정보 목록 조회</title>
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
<h2>주문 목록</h2>
<%
PreparedStatement pstmt = null;
ResultSet rs = null;

int mun = 0;
String sql = "select count(*) from order0802";
pstmt = conn.prepareStatement(sql);
rs=pstmt.executeQuery();

if(rs.next()){
	mun = rs.getInt(1);
}
%>
<p>총 <%=mun %>개의 상품이 있습니다.</p><hr>
<table border="1" id="t">
<tr>
<th>상품코드</th><th>주문자이름</th><th>주문날짜</th><th>배달주소</th><th>전화번호</th>
<th>결제방법</th><th>카드번호</th><th>주문상품수</th><th>판매가격</th><th>총금액</th>
<th>구분</th>
</tr>
<%
try{
	sql = "select a.id,b.name,b.orderdate,b.addr,b.tel,b.pay,b.cardno,b.prodcount,b.total from product0802 a,order0802 b where a.id=b.id order by id asc";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	int allsum=0;
	
	while(rs.next()){
		String id = rs.getString(1);
		String name = rs.getString(2);
		String orderdate = rs.getString(3);
		String tel = rs.getString(4);
		String addr = rs.getString(5);
		String pay = rs.getString(6);
		String cardno = rs.getString(7);
		String prodcount = rs.getString(8);
		String total = rs.getString(9);
		allsum = (rs.getInt(9)+allsum);
		%>
		<tr>
		<td class="t"><%=id %></td>
		<td class="t"><%=name %></td>
		<td class="t"><%=orderdate %></td>
		<td class="t"><%=tel %></td>
		<td class="t"><%=addr %></td>
		<td class="t"><%=pay %></td>
		<td class="t"><%=cardno %></td>
		<td class="t"><%=prodcount %></td>
		<td class="t"><%=total %></td>
		<td class="t"><%=allsum %></td>
		<td class="t">
		<a href="order_update.jsp?id=<%=id %>">수정</a> / 
		<a href="order_delete.jsp?id=<%=id %>" onclick="if(!confirm("정말로 삭제하시겠습니까?"))return false;">삭제</a>
		</td>
		</tr>
		<%
	}
}catch(SQLException e){
	System.out.println("조회 실패");
	e.printStackTrace();
}
%>
</table>
<a href="order_insert.jsp"><button id="bw">작성</button></a>
</section>
<footer><%@include file = "footer.jsp" %></footer>
</body>
</html>
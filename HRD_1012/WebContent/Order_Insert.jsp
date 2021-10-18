<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문정보등록</title>
<script type="text/javascript">
function idck() {
	form.submit();
}
function pay_cash() {
	const target = document.getElementById("pay_cardno");
	target.disabled = true;
}
function pay_card() {
	const target = document.getElementById("pay_cardno");
	target.disabled = false;
	alert("카드번호를 입력하세요.");
	form.cardno.focus();
}
function btn(str) {
	if(str=="insert"){
		form.action = "Order_InsertProcess.jsp";
	}
}
</script>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section><%@include file="DBconn.jsp" %>
<br/><h2>주문정보 등록</h2>
<form name="form" method="post" action="Order_Insert.jsp">
<table border="1" id="t1">
<%
PreparedStatement pstmt = null;
ResultSet rs = null;

String id = request.getParameter("id");
String name = request.getParameter("name");
String orderdate = request.getParameter("orderdate");
String addr = request.getParameter("addr");
String tel = request.getParameter("tel");
String pay = request.getParameter("pay");
String cardno = request.getParameter("cardno");
String prodcount = request.getParameter("prodcount");

int pcount=0, price=0, total=0;

	if(name==null||name.equals("null")){
		name="";
	}if(orderdate==null||orderdate.equals("null")){
		name="";
	}if(tel==null||tel.equals("null")){
		tel="";
	}if(addr==null||addr.equals("null")){
		addr="";
	}if(pay==null||pay.equals("null")){
		pay="";
	}if(cardno==null||cardno.equals("null")){
		cardno="";
	}if(prodcount==null||prodcount.equals("null")){
		pcount=0;
	}else{
		pcount = Integer.parseInt(prodcount);
	}
	try{
	String sql = "select id,downprice from product1012 where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		id = rs.getString(1);
		price = rs.getInt(2);
		total = pcount * price;
	}else if(id==null||id.equals("null")){
		id="";
		}else{
			id="";
			price=0;
			total=0;
		%>
		<script>
		alert("등록되지 않은 코드입니다.");
		history.back(-1);
		</script>
		<%
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<tr>
<th>상품코드</th>
<td><input type="text" name="id" onchange="idck();" value="<%=id %>"></td>
<th>주문자 이름</th>
<td><input type="text" name="name" value="<%=name%>"></td>
</tr>

<tr>
<th>주문 날짜</th>
<td><input type="text" name="orderdate" value="<%=orderdate%>"></td>
<th>전화번호</th>
<td><input type="text" name="tel" value="<%=tel%>"></td>
</tr>

<tr>
<th>배달주소</th>
<td colspan="4"><input type="text" name="addr" size="70" value="<%=addr%>" ></td>
</tr>

<tr>
<th>결제방법</th>
<td>
<input type="radio" name="pay" value="cash" onclick="pay_cash()"> 현금
<input type="radio" name="pay" value="card" onclick="pay_card()"> 카드
</td>
<th>카드번호</th>
<td><input type="text" name="cardno" value="<%=cardno%>" id="pay_cardno"></td>
</tr>

<tr>
<th>주문상품수</th>
<td><input type="text" name="prodcount" value="<%=prodcount%>" onchange="idck();" ></td>
<th>주문금액</th>
<td><input type="text" name="total" value="<%=total%>" ></td>
</tr>

<tr>
<td colspan="4" id="btn">
<a href="Order_Select.jsp"><input type="button" value="목록" class="bt1"></a>
<input type="submit" value="저장" onclick="btn('insert');" class="bt1">
</td>
</tr>
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main화면</title>
<script type="text/javascript">
function btn_check(str) {
	if(str=="insert"){
		form.action="insert_orderProcess.jsp";
	}
}
function changsubmit() {
	document.form.submit();
}
//라디오 버튼 결제방법
//id값 no_card를 지정해서 현금버튼 누르면 카드번호 창 비활성화
function pay_cash() {
	const target = document.getElementById("no_card");
	target.disabled = true;
}
//카드버튼 누르면 카드번호 창 활성화 및 알람창 출력
function pay_card() {
	const target = document.getElementById("no_card");
	target.disabled = false;
	alert("카드번호를 입력하세요.");
	document.form.cardno.focus();
}
</script>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<h2>주문 정보 등록 화면</h2><hr/>
<form name="form" method="post" action="insert_order.jsp">
<table border="1" id="insert_m">
<%
PreparedStatement pstmt = null;
ResultSet rs = null;
String id = request.getParameter("id");
String name = request.getParameter("name");
String orderdate = request.getParameter("orderdate");
String tel = request.getParameter("tel");
String addr = request.getParameter("addr");
String pay = request.getParameter("pay");
String cardno = request.getParameter("cardno");
String prodcount = request.getParameter("prodcount");

int pcount=0, total=0, price=0;

if(name==null||name.equals("null")){
	name="";
}if(orderdate==null||orderdate.equals("null")){
	orderdate="";
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
	pcount=Integer.parseInt(prodcount);
}

try{
String sql = "select producId,unitprice from product0908 where producId=?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, id);
rs=pstmt.executeQuery();

if(rs.next()){
	id = rs.getString(1);
	price = rs.getInt(2);
	total = price*pcount;
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
<td><input type="text" name="id" size="30" value="<%=id%>"></td>

<th>주문자 이름</th>
<td><input type="text" name="name" size="30" value="<%=name%>"></td>
</tr>

<tr>
<th>주문 날짜</th>
<td><input type="text" name="orderdate" size="30" value="<%=orderdate%>"></td>

<th>전화번호</th>
<td><input type="text" name="tel" size="30" value="<%=tel%>"></td>
</tr>

<tr>
<th>배달주소</th>
<td colspan="4"><input type="text" name="addr" size="20" value="<%=addr%>"></td>
</tr>

<tr>
<th>결제방법</th>
<td>
<input type="radio" name="pay" value="cash" onclick="javascript:pay_cash()">현금
<input type="radio" name="pay" value="card" onclick="javascript:pay_card()">카드
</td>

<th>카드번호</th>
<td><input type="text" name="cardno" value="<%=cardno %>"  id="no_card" size="30"></td>
</tr>

<tr>
<th>주문상품수</th>
<td><input type="text" name="prodcount" size="50" value="<%=prodcount%>" onchange="javascript:changsubmit();"></td>

<th>주문금액</th>
<td><input type="text" name="total" size="20" value="<%=total%>"></td>
</tr>

<tr>
<td colspan="4" id="btn">
<input type="button" value="목록" onclick="history.back(); return false;">
<input type="submit" value="저장" onclick="btn_check('insert')" class="btn_a">
</td>
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
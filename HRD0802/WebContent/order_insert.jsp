<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문정보등록</title>
<style>
#t{
margin: 0 auto;
width: 700px;
height: 70%;
}
.t{
background-color: #E6E6E6;
}
input{
height: 30px;
}

#bw{
text-align: center;
}
.bw_sw{
width: 100px;
height: 30px;
background-color: #848484;
color: white;
}
select{
height: 30px;
}
</style>
<script>
/*라디오버튼에 따라 카드번호창 활성화유무  */
function pay_select_cash() {
	const target = document.getElementById("no_card");
	target.disabled = true;
}
function pay_select_card() {
	const target = document.getElementById("no_card");
	target.disabled = false;
	alert("카드번호를 입력하세요.");
	document.form.cardno.focus();
}
function changesubmit() {
	document.form.submit();
}
function btn_check(str) {
	if(str=="insert"){
		form.action="order_insert_process.jsp";
	}
}
</script>
</head>
<body>
<header><%@include file = "header.jsp" %></header>
<nav><%@include file  =  "nav.jsp" %></nav>
<section>
<%@include file = "dbconn.jsp" %>
<h2>주문정보 등록</h2>
<form name="form" method="post" action="order_insert.jsp">
<table border="1" id="t">
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

int price =0, total=0, pcount=0;
if(name==null||name.equals("null")){
	name="";
}if(orderdate==null||name.equals("null")){
	name="";
}if(addr==null||addr.equals("null")){
	addr="";
}if(pay==null||pay.equals("null")){
	pay="";
}if(tel==null||tel.equals("null")){
	tel="";
}if(cardno==null||cardno.equals("null")){
	cardno="";
}if(prodcount==null||prodcount.equals("null")){
	pcount=0;
}else{
	pcount=Integer.parseInt(prodcount);
}
try{
	String sql = "select id,downprice from product0802 where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		id = rs.getString(1);
		price = rs.getInt(2);
		total = price*pcount;
		
	}else if(id==null|| id.equals("null")){
		id="";
	}else{
		id="";
		price = 0;
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
<th class="t">상품 코드</th>
<td><input type="text" name="id" size="30" value="<%=id %>" onchange="javascript:changesubmit();" ></td>

<th class="t">주문자 이름</th>
<td><input type="text" name="name" size="30"></td>

<tr>
<th class="t">주문 날짜</th>
<td><input type="text" name="orderdate" size="30" ></td>

<th class="t">전화번호</th>
<td><input type="text" name="tel" size="30" ></td>
</tr>

<tr>
<th class="t">배달주소</th>
<td colspan="4"><input type="text" name="addr" size="70"></td>
</tr>

<tr>
<th class="t">결제방법</th>
<td>
<input type="radio" name="pay" value="cash"  onclick="pay_select_cash()">현금
<input type="radio" name="pay" value="card" onclick="pay_select_card()">카드
</td>

<th class="t">카드번호</th>
<td><input type="text" name="cardno" size="30" id="no_card" ></td>
</tr>

<tr>
<th class="t">주문상품수</th>
<td><input type="text" name="prodcount" size="30"></td>

<th class="t">주문금액</th>
<td><input type="text" name="total" size="30" value="<%=total%>"></td>
</tr>

<tr>
<td colspan="4" id="bw">
<a href="order_select.jsp"><button type="button" onclick="history.back(); return false;" class="bw_sw">목록</button></a>
<button type="submit" class="bw_sw" onclick="btn_check("insert");">저장</button>
</td>
</table>
</form>
</section>
<footer><%@include file = "footer.jsp" %></footer>

</body>
</html>
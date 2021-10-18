<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문정보 등록</title>
<script type="text/javascript">
function idck() {
	form.submit();
}
function btn(str) {
	if(str=='insert'){
		form.action = "insert_orderProcess.jsp";
	}
}
function pay_cashs() {
	const target = document.getElementById("pay_select");
	target.disabled = true;
}
function pay_cards() {
	const target = document.getElementById("pay_select");
	target.disabled = false;
	alert("카드번호를 입력하세요");
	form.CARDNO.focus();
}
</script>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section><%@include file="DBconn.jsp" %>
<br/><h2>주문 정보 등록 화면</h2>
<form name="form" method="post" action="insert_order.jsp">
<table border="1" id="t3">
<%
PreparedStatement pstmt = null;
ResultSet rs = null;

String id = request.getParameter("id");
String name = request.getParameter("name");
String ORDERDATE = request.getParameter("ORDERDATE");
String TEL = request.getParameter("TEL");
String ADDR = request.getParameter("ADDR");
String pay = request.getParameter("pay");
String CARDNO = request.getParameter("CARDNO");
String PRODCOUNT = request.getParameter("PRODCOUNT");

int pcount=0, price=0, total=0;

if(name==null||name.equals("null")){
	name="";
}if(ORDERDATE==null||ORDERDATE.equals("null")){
	name="";
}if(TEL==null||TEL.equals("null")){
	TEL="";
}if(ADDR==null||ADDR.equals("null")){
	ADDR="";
}if(pay==null||pay.equals("null")){
	pay="";
}if(CARDNO==null||CARDNO.equals("null")){
	CARDNO="";
}if(PRODCOUNT==null||PRODCOUNT.equals("null")){
	pcount=0;
}else{
	pcount=Integer.parseInt(PRODCOUNT);
}
try{
	String sql = "select PRODUCTID,UNITPRICE from product1011 where PRODUCTID=?";
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
	alert("등록되지않은 코드입니다.");
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
<td><input type="text" name="id" value="<%=id %>"  onchange="idck();"></td>
<th>주문자 이름</th>
<td><input type="text" name="name" value="<%=name %>" ></td>
</tr>

<tr>
<th>주문날짜</th>
<td><input type="text" name="ORDERDATE" value="<%=ORDERDATE %>"></td>
<th>전화번호</th>
<td><input type="text" name="TEL" value="<%=TEL %>"></td>
</tr>

<tr>
<th>배달주소</th>
<td colspan="4"><input type="text" name="ADDR" size="120" value="<%=ADDR %>"></td>
</tr>

<tr>
<th>결제방법</th>
<td>
<input type="radio" name="pay" value="cash" onclick="pay_cashs()" > 현금
<input type="radio" name="pay" value="card" onclick="pay_cards()" > 카드
</td>
<th>카드번호</th>
<td><input type="text" name="CARDNO" value="<%=CARDNO %>" id="pay_select"></td>
</tr>

<tr>
<th>주문상품수</th>
<td><input type="text" name="PRODCOUNT" onchange="idck();" value="<%=PRODCOUNT %>"></td>
<th>주문금액</th>
<td><input type="text" name="total" value="<%=total %>"></td>
</tr>

<tr>
<td colspan="4" id="bt1">
<a href="select_order.jsp"><input type="button" value="목록" class="bt1"></a>
<input type="submit" value="저장" onclick="btn('insert');" class="bt1">
</td>
</tr>

</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
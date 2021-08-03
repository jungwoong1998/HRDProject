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

</script>
</head>
<body>
<header><%@include file = "header.jsp" %></header>
<nav><%@include file  =  "nav.jsp" %></nav>
<section>
<%@include file = "dbconn.jsp" %>
<h2>주문정보 등록</h2>
<form name="form" method="post" action="product_insert_process.jsp">
<table border="1" id="t">

<tr>
<th class="t">상품 코드</th>
<td><input type="text" name="id" size="30" onchange=""></td>

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
<input type="radio" name="pay" value="cash">현금
<input type="radio" name="pay" value="card">카드
</td>

<th class="t">카드번호</th>
<td><input type="text" name="pay_card" size="30"></td>
</tr>

<tr>
<th class="t">주문상품수</th>
<td><input type="text" name="prodcount" size="30"></td>

<th class="t">주문금액</th>
<td><input type="text" name="total" size="30"></td>
</tr>

<tr>
<td colspan="4" id="bw">
<a href="order_select.jsp"><input type="button" value="목록" class="bw_sw"></a>
<input type="submit" value="저장" class="bw_sw" onclick="javascript:check()">
</td>
</table>
</form>
</section>
<footer><%@include file = "footer.jsp" %></footer>

</body>
</html>
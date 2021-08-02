<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품정보 등록화면</title>
</head>
<body>
<header><%@include file = "header.jsp" %></header>
<nav><%@include file  =  "nav.jsp" %></nav>
<section>
<%@include file = "dbconn.jsp" %>
<h2>상품 추가</h2>
<form name="form" method="post" action="product_insert_process.jsp">
<table border="1">
<tr>
<th>상품 코드</th>
<td><input type="text" name="id" ></td>
</tr>

<tr>
<th>
</table>
</form>
</section>
<footer><%@include file = "footer.jsp" %></footer>

</body>
</html>
<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수당 정보 등록화면</title>
<script>
function check() {
	if(document.form.name.value==""){
		alert("사번이 입력되지 않았습니다.");
		document.form.name.focus();
	}else{
		document.form.submit();
	}
}
</script>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="dbconn.jsp" %>
<h1>수당 정보등록 화면</h1><hr>
<form name="form" method="post" action="sudang_process.jsp">
<table border="1" id="t1">

<tr>
<th>사원번호</th>
<td><input type="text" name="id" class="f1" size="30"></td>
</tr>

<tr>
<th>가족수당</th>
<td><input type="text" name="gajok"  class="f1" size="30"></td>
</tr>

<tr>
<th>직책수당</th>
<td><input type="text" name="jikchak"  class="f1" size="30"></td>
</tr>

<tr>
<th>근속수당</th>
<td><input type="text" name="gunsok"  class="f1" size="30"></td>
</tr>

<tr>
<th>기타수당</th>
<td><input type="text" name="gitasudang"  class="f1" size="30" ></td>
</tr>

<tr>
<td colspan="2" id="btn_a">
<input type="button" value="등록" onclick="javascript:check()" class="btn_a1">
<input type="reset" value="취소" class="btn_a1">
</td>
</tr>
</table>
</form><hr>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
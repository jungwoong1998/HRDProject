<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학사정보 등록</title>
<script>
function check() {
	if(document.form.studNo.value==""){
		alert("학번이 입력되지 않았습니다.");
		document.form.studNo.focus();
	}else if(document.form.name.value==""){
		alert("이름이 입력되지 않았습니다.");
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
<%@include file="DBconn.jsp" %>
<br/>
<h1 style="font-family: sans-serif;" align="center">학사 정보 등록 화면</h1>
<form name="form" method="post" action="studProcess.jsp">
<table border="3" id="forn" style="margin: 0 auto; width: 600px; height: 200px;">
<tr>
<th>학번</th>
<td><input type="text" name="studNo" size="40"></td>
</tr>

<tr>
<th>성명</th>
<td><input type="text" name="name" size="40"></td>
</tr>

<tr>
<th>학과</th>
<td><select name="dept" style="width: 150px; height: 20px;">
<option value="1">컴퓨터공학과</option>
<option value="2">기계공학과</option>
<option value="3">전자과</option>
<option value="4">영문학과</option>
<option value="5">일어과</option>
<option value="6">경영학과</option>
<option value="7">무역학과</option>
<option value="8">교육학과</option>
</select></td>
</tr>

<tr>
<th>학년</th>
<td><select name="position" style="width: 150px; height: 20px;">
<option value="1">1학년</option>
<option value="2">2학년</option>
<option value="3">3학년</option>
<option value="4">4학년</option>
</select></td>
</tr>

<tr>
<th>주소</th>
<td><input type="text" name="address" size="40"></td>
</tr>

<tr>
<th>연락처</th>
<td><input type="text" name="phone" size="40"></td>
</tr>

<tr>
<td colspan="2" id="btn">
<input type="button" value="등록" onclick="javascript:check()" class="a">
<input type="button" value="취소" class="a">
</td>
</tr>
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
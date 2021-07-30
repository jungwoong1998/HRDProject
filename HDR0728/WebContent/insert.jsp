<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성적입력</title>
<style>
#t{
margin: 0 auto;
width: 400px; height: 210px;
}
#bt{
text-align: center;
}
</style>
<script>
function check() {
	if(document.form.sNo.value==""){
		alert("학번이 입력되지 않았습니다");
		document.form.sNo.focus();
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
<%@include file = "dbconn.jsp" %>
<h2>학생 성적입력</h2>
<form name="form" method="post" action="insert_process.jsp">
<table border="1" id="t">

<tr>
<th>학번</th>
<td><input type="text" name="sNo" size="30"></td>
</tr>

<tr>
<th>성명</th>
<td><input type="text" name="sName" size="30"></td>
</tr>

<tr>
<th>국어</th>
<td><input type="text" name="kor" size="30"></td>
</tr>

<tr>
<th>영어</th>
<td><input type="text" name="eng" size="30"></td>
</tr>

<tr>
<th>수학</th>
<td><input type="text" name="math" size="30"></td>
</tr>

<tr>
<th>역사</th>
<td><input type="text" name="hist" size="30"></td>
</tr>

<tr>
<td colspan="2" id="bt">
<input type="button" value="성적저장" onclick="javascript:check()">
</td>
</tr>
</table>
</form>
</section>
<footer><%@include file = "footer.jsp" %></footer>
</body>
</html>
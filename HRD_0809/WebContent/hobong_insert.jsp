<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인사관리 호봉 등록화면</title>
<script>
function check() {
	if(document.form.salary.value==""){
		alert("급여를 입력해주세요");
		document.form.salary.focus();
	}else{
		document.form.submit();
	}
}
</script>
</head>
<body>
<header><%@include file = "header.jsp" %></header>
<nav><%@include file = "nav.jsp" %></nav>
<section>
<%@include file = "dbconn.jsp" %>
<h1>인사관리 호봉 등록 화면</h1><hr>
<form name="form" method="post" action="hobong_process.jsp">
<table border="1" id="t3">
<tr>
<th>직급</th>
<td><select name="dunggub" class="s3">
<option value="1">1급</option>
<option value="2">2급</option>
<option value="3">3급</option>
<option value="4">4급</option>
<option value="5">5급</option>
</select></td>
</tr>

<tr>
<th>급여</th>
<td><input type ="text" name="salary" size="30"></td>
</tr>

<tr>
<td colspan="2" id="btn_a">
<input type="button" value="등록" class="btn_a1" onclick="javascript:check()">
<a href="index.jsp"><input type="button" value="취소" class="btn_a1"></a>
</td>
</tr>

</table><hr>
</form>
</section>
<footer><%@include file = "footer.jsp" %></footer>
</body>
</html>
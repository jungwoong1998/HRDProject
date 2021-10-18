<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main화면</title>
<script type="text/javascript">
function check() {
	if(form.sNo.value==""){
		alert("학번을 입력하세요");
		form.sNo.focus();
	}else if(form.sName.value==""){
		alert("이름을 입력하세요");
		form.sName.focus();
	}else if(form.kor.value==""){
		alert("국어성적을 입력하세요");
		form.kor.focus();
	}else if(form.eng.value==""){
		alert("영어성적을 입력하세요");
		form.eng.focus();
	}else if(form.math.value==""){
		alert("수학성적을 입력하세요");
		form.math.focus();
	}else if(form.hist.value==""){
		alert("역사성적을 입력하세요");
		form.hist.focus();
	}else{
		form.submit();
	}
}
</script>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<h1 align="center">학생 성적 입력</h1><br/>
<form name="form" method="post" action="insertProcess.jsp">
<table border="1" id="t1">
<tr>
<th>학번</th>
<td><input type="text" name="sNo"></td>
</tr>

<tr>
<th>성명</th>
<td><input type="text" name="sName"></td>
</tr>

<tr>
<th>국어</th>
<td><input type="text" name="kor"></td>
</tr>

<tr>
<th>영어</th>
<td><input type="text" name="eng"></td>
</tr>

<tr>
<th>수학</th>
<td><input type="text" name="math"></td>
</tr>

<tr>
<th>역사</th>
<td><input type="text" name="hist"></td>
</tr>

<tr>
<td colspan="2" id="btn">
<input type="button" value="성적저장" onclick="check()">
</td>
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
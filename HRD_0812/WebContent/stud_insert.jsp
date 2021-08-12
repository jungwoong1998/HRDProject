<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학사 정보 등록</title>
<script>
function check() {
	if(document.form.stud.value==""){
		alert("학번이 입력되지 않았습니다.");
		document.form.id.focus();
	}else if(document.form.name.value==""){
		alert("성명을 입력하세요.");
		document.form.name.focus();
	}else if(document.form.dept.value==""){
		alert("학과를 선택하세요.");
		document.form.dept.focus();
	}else if(document.form.posi.value==""){
		alert("학년을 선택하세요.");
		document.form.posi.focus();
	}
	else{
		document.form.submit();
	}
}
</script>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file ="nav.jsp" %></nav>
<section>
<%@include file = "dbconn.jsp" %>
<h2>학사 정보 등록 화면</h2>
<form name="form" method="post" action="stud_process.jsp">
<table border="2" id="insert2">
<tr>
<th>학번</th>
<td><input type="text" name="stud" size="40"></td>
</tr>

<tr>
<th>성명</th>
<td><input type="text" name="name" size="40"></td>
</tr>

<tr>
<th>학과</th>
<td><select name="dept">
<option value="1" checked>컴퓨터공학과</option>
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
<td><select name="posi">
<option value="1" checked>1학년</option>
<option value="2">2학년</option>
<option value="3">3학년</option>
<option value="4">4학년</option>
</select>
</td>
</tr>

<tr>
<th>주소</th>
<td><input type="text" name="addr" size="40"></td>
</tr>

<tr>
<th>연락처</th>
<td><input type="text" name="phone" size="40"></td>
</tr>

<tr>
<td colspan="2" id="btn_in">
<input type="button" value="등록" class="btn_i2" onclick="javascript:check()">
<input type="reset" value="취소" class="btn_i2"></a>
</td>
</tr>
</table>
</form>
</section>
<footer><%@include file ="footer.jsp" %></footer>
</body>
</html>
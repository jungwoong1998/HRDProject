<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>교과목 등록</title>
<script>
function check() {
	if(document.form.id.value==""){
		alert("교과목 코드가 입력되지 않았습니다.");
		document.form.id.focus();
	}else if(document.form.subject_name.value==""){
		alert("교과목명이 입력되지 않았습니다.");
		document.form.subject_name.focus();
	}else if(document.form.credit.value==""){
		alert("학점이 입력되지 않았습니다.");
		document.form.credit.focus();
	}else if(document.form.lecturer.value==""){
		alert("담당강사가 입력되지 않았습니다.");
		document.form.lecturer.focus();
	}else if(document.form.start_hour.value==""){
		alert("시작시간이 입력되지 않았습니다.");
		document.form.start_hour.focus();
	}else if(document.form.end_hour.value==""){
		alert("종료시간이 입력되지 않았습니다.");
		document.form.end_hour.focus();
	}
	else{
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
<h2 style="font-family: sans-serif;" align="center">교과목 추가</h2>
<form name="form" method="post" action="subProcess.jsp">
<table border="3" id="forn" style="margin: 0 auto; width: 600px; height: 200px; font-weight: 600;">
<tr>
<th>교과목 코드</th>
<td><input type="text" name="id" size="40"></td>
</tr>

<tr>
<th>성명</th>
<td><input type="text" name="subject_name" size="40"></td>
</tr>

<tr>
<th>학 점</th>
<td><input type="text" name="credit" size="40"></td>
</tr>

<tr>
<th>담 당 강 사</th>
<td><select name="lecturer" style="width: 150px; height: 20px;">
<option value="">담당강사 선택</option>
<option value="1">김교수</option>
<option value="2">이교수</option>
<option value="3">박교수</option>
<option value="4">우교수</option>
<option value="5">최교수</option>
<option value="6">강교수</option>
<option value="7">황교수</option>
</select></td>
</tr>

<tr>
<th>요일</th>
<td>
<input type="radio" name="week" value="1" style="vertical-align: -2px;" checked> 월
<input type="radio" name="week" value="2" style="vertical-align: -2px;"> 화
<input type="radio" name="week" value="3" style="vertical-align: -2px;"> 수
<input type="radio" name="week" value="4" style="vertical-align: -2px;"> 목
<input type="radio" name="week" value="5" style="vertical-align: -2px;"> 금
<input type="radio" name="week" value="6" style="vertical-align: -2px;"> 토
</td>
</tr>

<tr>
<th>시 작</th>
<td><input type="text" name="start_hour" size="40"></td>
</tr>

<tr>
<th>종 료</th>
<td><input type="text" name="end_hour" size="40"></td>
</tr>

<tr>
<td colspan="2" id="btn">
<input type="button" value="목록" class="a">
<input type="button" value="등록"  onclick="javascript:check()" class="a">
</td>
</tr>
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
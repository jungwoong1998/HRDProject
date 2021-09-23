<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>교과목 추가</title>
<script type="text/javascript">
function check() {
	if(document.form.id.value==""){
		alert("교과목 코드가 입력되지 않았습니다.");
		document.form.id.focus();
	}else if(document.form.name.value==""){
		alert("교과명이 입력되지 않았습니다.");
		document.form.name.focus();
	}else if(document.form.credit.value==""){
		alert("학점이 입력되지 않았습니다.");
		document.form.credit.focus();
	}else if(document.form.lecturer.value==""){
		alert("담당강사가 입력되지 않았습니다.");
		document.form.lecturer.focus();
	}else if(document.form.start_hour.value==""){
		alert("시작시간이 입력되지 않았습니다.");
		document.form.start_hour.focus();
	}else if(document.form.end_end.value==""){
		alert("종료시간이 입력되지 않았습니다.");
		document.form.end_end.focus();
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
<br/><h2>교과목 추가</h2>
<form name="form" method="post" action="courseProcess.jsp">
<table border="3" id="tbn_insert">
<tr>
<th>교과목 코드</th>
<td><input type="text" name="id" size="30"></td>
</tr>

<tr>
<th>과 목 명</th>
<td><input type="text" name="name" size="30"></td>
</tr>

<tr>
<th>학 점</th>
<td><input type="text" name="credit" size="30"></td>
</tr>

<tr>
<th>담 당 강 사</th>
<td><select name="lecturer">
<option value="">담당강사 선택</option>
<option value="1">김교수</option>
<option value="2">이교수</option>
<option value="3">박교수</option>
<option value="4">우교수</option>
<option value="5">최교수</option>
<option value="6">강교수</option>
<option value="7">황교수</option>
</td>
</tr>

<tr>
<th>요 일</th>
<td>
<input type="radio" name="week" value="1" checked> 월
<input type="radio" name="week" value="2"> 화
<input type="radio" name="week" value="3"> 수
<input type="radio" name="week" value="4"> 목
<input type="radio" name="week" value="5"> 금
<input type="radio" name="week" value="6"> 토
</td>
</tr>

<tr>
<th>시 작</th>
<td><input type="text" name="start_hour" size="30"></td>
</tr>

<tr>
<th>종 료</th>
<td><input type="text" name="end_end" size="30"></td>
</tr>

<tr>
<td colspan="2" id="btn">
<a href="select_course.jsp"><input type="button" value="목록" class="btn1"></a>
<input type="button" value="등록" class="btn1" onclick="javascript:check()">
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
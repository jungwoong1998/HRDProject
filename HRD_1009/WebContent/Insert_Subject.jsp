<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>교과목 추가</title>
<script type="text/javascript">
	function check() {
		if(form.id.value==""){
			alert("교과목 코드가 입력되지 않았습니다.");
			form.id.focus();
			return false;
		}
		if(form.name.value==""){
			alert("교과목명이 입력되지 않았습니다.");
			form.name.focus();
			return false;
		}
		if(form.credit.value==""){
			alert("학점이 입력되지 않았습니다.");
			form.credit.focus();
			return false;
		}
		if(form.lecturer.value==""){
			alert("담당강사가 입력되지 않았습니다.");
			form.lecturer.focus();
			return false;
		}
		var cnt = 0;
		var week = document.getElementsByName("week");
		for(var i=0; i<week.length; i++){
			if(week[i].checked == true){
				cnt++;
				break;
			}
		}
		if(cnt==0){
			alert("요일이 입력되지 않았습니다.");
			return false;
		}
		if(form.start_hour.value==""){
			alert("시작시간이 입력되지 않았습니다.");
			form.start_hour.focus();
			return false;
		}
		if(form.end_end.value==""){
			alert("종료시간이 입력되지 않았습니다.");
			form.end_end.focus();
			return false;
		}
		form.submit();
		alert("완료되었습니다.");
	}
</script>
</head>
<body>
<header><%@include file = "header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<br/><h2>교과목 추가</h2>
<form name="form" method="post" action="Insert_SubjectProcess.jsp">
<table border="1" id="t2">
<tr>
<th class="in3">교과목 코드</th>
<td><input type="text" name="id" size="40"></td>
</tr>

<tr>
<th class="in3">과 목 명</th>
<td><input type="text" name="name" size="40"></td>
</tr>

<tr>
<th class="in3">학 점</th>
<td><input type="text" name="credit" size="40"></td>
</tr>

<tr>
<th class="in3">담 당 강 사</th>
<td><select name="lecturer" style="height: 30px; width: 150px">
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
<th class="in3">요 일</th>
<td>
<input type="radio" name="week" value="1" class="in4" > 월
<input type="radio" name="week" value="2" class="in4"> 화
<input type="radio" name="week" value="3" class="in4"> 수
<input type="radio" name="week" value="4" class="in4"> 목
<input type="radio" name="week" value="5" class="in4"> 금
<input type="radio" name="week" value="6" class="in4"> 토
</td>
</tr>

<tr>
<th class="in3">시 작</th>
<td><input type="text" name="start_hour" size="40"></td>
</tr>

<tr>
<th class="in3">종 료</th>
<td><input type="text" name="end_end" size="40"></td>
</tr>

<tr>
<td colspan="2" id="btn">
<a href="Select_Subject.jsp"><input type="button" value="목록" class="btn1"></a>
<input type="button" value="등록" onclick="javascript:check()" class="btn1">
</td>
</tr>
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
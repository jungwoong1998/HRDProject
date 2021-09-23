<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학사정보 추가</title>
<script type="text/javascript">
function check() {
	if(document.form.studno.value==""){
		alert("학번이 입력되지 않았습니다.");
		document.form.studno.focus();
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
<br/><h1>학사 정보 등록 화면</h1>
<form name="form" method="post" action="studProcess.jsp">
<table border="3" id="tbn_insert">
<tr>
<th width="200px;">학번</th>
<td><input type="text" name="studno" size="50"></td>
</tr>

<tr>
<th>성명</th>
<td><input type="text" name="name" size="50"></td>
</tr>

<tr>
<th>학과</th>
<td><select name="dept" style="width: 120px; height: 25px;">
<option value="1">컴퓨터공학과</option>
<option value="2">기계공학과</option>
<option value="3">전자과</option>
<option value="4">영문학과</option>
<option value="5">일어과</option>
<option value="6">경영학과</option>
<option value="7">무역학과</option>
<option value="8">교육학과</option>
</td>
</tr>

<tr>
<th>학년</th>
<td><input type="radio" name="position" value="1" checked> 1학년
<input type="radio" name="position" value="2"> 2학년
<input type="radio" name="position" value="3"> 3학년
<input type="radio" name="position" value="4"> 4학년
</td>
</tr>

<tr>
<th>취미</th>
<!-- checkbox는 radio처럼 밸류값을 주면됨 -->
<td>
<input type="checkbox" name="hobby" value="프로그램" > 프로그램
<input type="checkbox" name="hobby" value="독서"> 독서
<input type="checkbox" name="hobby" value="등산"> 등산
<input type="checkbox" name="hobby" value="여행"> 여행
<input type="checkbox" name="hobby" value="낚시"> 낚시
<input type="checkbox" name="hobby" value="영화보기"> 영화보기
<input type="checkbox" name="hobby" value="잠자기"> 잠자기
<input type="checkbox" name="hobby" value="멍때리기"> 멍때리기
</td>
</tr>

<tr>
<th>주소</th>
<td><input type="text" name="address" size="50"></td>
</tr>

<tr>
<th>연락처</th>
<td><input type="text" name="phone" size="50"></td>
</tr>

<tr>
<td colspan="2" id="btn">
<a href="select_stud.jsp"><input type="button" value="목록" class="btn1"></a>
<input type="button" value="등록" class="btn1" onclick="javascript:check()">
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
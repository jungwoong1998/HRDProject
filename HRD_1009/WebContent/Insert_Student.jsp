<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학사정보 추가</title>
<script type="text/javascript">
	function check() {
		if(form.studno.value==""){
			alert("학번이 입력되지 않았습니다.");
			form.studno.focus();
			return false;
		}
		if(form.name.value==""){
			alert("이름이 입력되지 않았습니다.");
			form.name.focus();
			return false;
		}
		var cnt=0;
		var hobby = document.getElementsByName("hobby");
		
		for(var i=0;i<hobby.length;i++){
			if(hobby[i].checked == true){
				cnt++;
				break;
			}
		}
		if(cnt==0){
			alert("취미를 선택하세요.");
			return false;
		}
		form.submit();
		alert("등록이 완료되었습니다!");
	}
</script>
</head>
<body>
<header><%@include file = "header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<br/><h2>학사 정보 등록 화면</h2>
<form name="form" method="post" action="Insert_StudentProcess.jsp">
<table border="1" id="t2">
<tr>
<th class="in3">학번</th>
<td><input type="text" name="studno" size="40"></td>
</tr>

<tr>
<th class="in3">성명</th>
<td><input type="text" name="name" size="40"></td>
</tr>

<tr>
<th class="in3">학과</th>
<td><select name="dept" style="height: 30px; width: 150px">
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
<th class="in3">학년</th>
<td>
<input type="radio" name="position" value="1" class="in4" checked> 1학년
<input type="radio" name="position" value="2" class="in4"> 2학년
<input type="radio" name="position" value="3" class="in4"> 3학년
<input type="radio" name="position" value="4" class="in4"> 4학년
</td>
</tr>

<tr>
<th class="in3">취미</th>
<td>
<input type="checkbox" name="hobby" value="프로그램" class="in4" >프로그램
<input type="checkbox" name="hobby" value="독서" class="in4">독서
<input type="checkbox" name="hobby" value="등산" class="in4">등산
<input type="checkbox" name="hobby" value="여행" class="in4">여행
<input type="checkbox" name="hobby" value="낚시" class="in4">낚시
<input type="checkbox" name="hobby" value="영화보기" class="in4">영화보기
<input type="checkbox" name="hobby" value="잠자기" class="in4">잠자기
<input type="checkbox" name="hobby" value="멍때리기" class="in4">멍때리기
</td>
</tr>

<tr>
<th class="in3">주소</th>
<td><input type="text" name="address" size="40"></td>
</tr>

<tr>
<th class="in3">연락처</th>
<td><input type="text" name="phone" size="40"></td>
</tr>

<tr>
<td colspan="2" id="btn">
<input type="button" value="등록" onclick="javascript:check()" class="btn1">
<input type="reset" value="취소" class="btn1">
</td>
</tr>
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
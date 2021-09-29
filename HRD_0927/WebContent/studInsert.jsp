<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main화면</title>
<script type="text/javascript">
function check() {
	if(document.stud.studno.value==""){
		alert("학번이 입력되지 않았습니다.");
		document.stud.studno.focus();
	}else if(document.stud.name.value==""){
		alert("이름이 입력되지 않았습니다.");
		document.stud.name.focus();
	}else{
		document.stud.submit();
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
<form name="stud" method="post" action="studProcess.jsp">
<table border="3" id="tbn_i3">
<tr>
<th class="tbn2">학번</th>
<td><input type="text" name="studno" size="30"></td>
</tr>

<tr>
<th class="tbn2">성명</th>
<td><input type="text" name="name"  size="30"></td>
</tr>

<tr>
<th class="tbn2">학과</th>
<td><select name="dept" class="sele1">
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
<th class="tbn2">학년</th>
<td>
<input type="radio" name="position" value="1" style="vertical-align: -8px" checked> 1학년
<input type="radio" name="position" value="2" style="vertical-align: -8px"> 2학년
<input type="radio" name="position" value="3" style="vertical-align: -8px"> 3학년
<input type="radio" name="position" value="4" style="vertical-align: -8px"> 4학년
</td>
</tr>

<tr>
<th class="tbn2">취미</th>
<td>
<input type="checkbox" name=hobby value="프로그램" style="vertical-align: -8px">프로그램
<input type="checkbox" name=hobby value="독서" style="vertical-align: -8px">독서
<input type="checkbox" name=hobby value="등산" style="vertical-align: -8px">등산
<input type="checkbox" name=hobby value="여행" style="vertical-align: -8px">여행
<input type="checkbox" name=hobby value="낚시" style="vertical-align: -8px">낚시
<input type="checkbox" name=hobby value="영화보기" style="vertical-align: -8px">영화보기
<input type="checkbox" name=hobby value="잠자기" style="vertical-align: -8px">잠자기
<input type="checkbox" name=hobby value="멍때리기" style="vertical-align: -8px">멍때리기
</td>
</tr>

<tr>
<th class="tbn2">주소</th>
<td><input type="text" name="address"  size="30"></td>
</tr>

<tr>
<th class="tbn2">연락처</th>
<td><input type="text" name="phone"  size="30"></td>
</tr>

<tr>
<td colspan="2" id="tbn_i2">
<input type="button" value="등록" onclick="javascript:check()" class="btn_i1">
<input type="reset" value="취소" class="btn_i1">
</td>
</tr>

</table>
</form>

</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
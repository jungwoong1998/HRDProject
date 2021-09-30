<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서회원 관리</title>
<script type="text/javascript">
function check() {
	if(document.bookinfo.bookno.value==""){
		alert("도서코드가 입력되지 않았습니다.");
		docuemnt.bookinfo.bookno.focus();
	}else if(document.bookinfo.author.value==""){
		alert("작가가 입력되지 않았습니다.");
		document.bookinfo.author.focus();
	}else if(document.bookinfo.bookname.value==""){
		alert("도서이름이 입력되지 않았습니다.");
		document.bookinfo.bookname.focus();
	}else{
		document.bookinfo.submit();
	}
}
</script>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<br/><h1>도서회원 관리 프로그램</h1>
<%@include file="DBconn.jsp" %>
<form name="bookinfo" method="post" action="bookinfoProcess.jsp">
<table border="3" id="tbn1">
<tr>
<th class="tbn1_tr">도서코드</th>
<td><input type="text" name="bookno" size="30"></td>
</tr>

<tr>
<th class="tbn1_tr">저자</th>
<td><input type="text" name="author" size="30"></td>
</tr>

<tr>
<th class="tbn1_tr">도서이름</th>
<td><input type="text" name="bookname" size="30"></td>
</tr>

<tr>
<td colspan="2" id="btn">
<input type="button" value="등록" class="bt" onclick="javascript:check()">
<input type="reset" value="취소" class="bt">
</td>
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
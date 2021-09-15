<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강사 등록</title>
<script>
function check() {
	if(document.form.name.value==""){
		alert("강사명이 입력되지 않았습니다.");
		document.form.name.focus();
	}else if(document.form.major.value==""){
		alert("전공이 입력되지 않았습니다.");
		document.form.major.focus();
	}else if(document.form.field.value==""){
		alert("세부전공이 입력되지 않았습니다.");
		document.form.field.focus();
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
<br/>
<h2 style="font-family: sans-serif;" align="center">강사 추가</h2>
<form name="form" method="post" action="techaerProcess.jsp">
<table border="3" id="forn" style="margin: 0 auto; width: 600px; height: 200px;">
<tr>
<th>강사 ID</th>
<%
PreparedStatement pstmt=null;
ResultSet rs = null;
int idxa=0;
//시퀸스 불러오는 쿼리문
String sql="select teacher0915_seq.nextval from dual";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();

if(rs.next()){
	idxa = rs.getInt(1);
}
%>
<td><input type="text" name="idx" size="40" value="<%=idxa %>">자동증가</td>
</tr>

<tr>
<th>강 사 명</th>
<td><input type="text" name="name" size="40"></td>
</tr>

<tr>
<th>전 공</th>
<td><input type="text" name="major" size="40"></td>
</tr>

<tr>
<th>세부 전공</th>
<td><input type="text" name="field" size="40"></td>
</tr>

<tr>
<td colspan="2" id="btn">
<input type="button" value="목록" class="a">
<input type="button" value="등록" onclick="javascript:check()" class="a">
</td>
</tr>
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
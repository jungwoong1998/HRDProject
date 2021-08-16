<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import ="java.sql.*" %>
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
<nav><%@include file ="nav.jsp" %></nav>
<section>
<%@include file = "dbconn.jsp" %>
<h2>강사 추가</h2>
<form name="form" method="post" action="lect_process.jsp">
<table border="2" id="insert2">
<%
PreparedStatement pstmt = null;
ResultSet rs = null;
request.setCharacterEncoding("utf-8");
String idxa = request.getParameter("idx");

String sql = "select lect_seq.nextval from dual";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

if(rs.next()){
	idxa = rs.getString(1);
}
%>
<tr>
<th>강사 ID</th>
<td><input type="text" name="idx" size="40" value="<%=idxa%>">자동증가(Sequence 발생)</td>
</tr>

<tr>
<th>강 사 명</th>
<td><input type="text" name="name" size="40"></td>
</tr>

<tr>
<th>전공</th>
<td><input type="text" name="major" size="40"></td>
</tr>

<tr>
<th>세부 전공</th>
<td><input type="text" name="field" size="40"></td>
</tr>

<tr>
<td colspan="2" id="btn_in">
<input type="button" value="목록" class="btn_i2">
<input type="button" value="등록" class="btn_i2" onclick="javascript:check()">
</td>
</tr>
</table>
</form>
</section>
<footer><%@include file ="footer.jsp" %></footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강사 수정</title>
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
<form name="form" method="post" action="techaerProcess_re.jsp">
<table border="3" id="forn" style="margin: 0 auto; width: 600px; height: 200px;">
<%
PreparedStatement pstmt=null;
ResultSet rs = null;

String idx = request.getParameter("idx");

String sql = "select * from teacher0915 where idx=?";
pstmt=conn.prepareStatement(sql);
pstmt.setString(1, idx);
rs=pstmt.executeQuery();

if(rs.next()){
	String name = rs.getString(2);
	String major = rs.getString(3);
	String field = rs.getString(4);

%>
<tr>
<th>강사 ID</th>
<td><input type="text" name="idx" size="40" value="<%=idx %>"></td>
</tr>

<tr>
<th>강 사 명</th>
<td><input type="text" name="name" size="40" value="<%=name %>"></td>
</tr>

<tr>
<th>전 공</th>
<td><input type="text" name="major" size="40" value="<%=major %>"></td>
</tr>

<tr>
<th>세부 전공</th>
<td><input type="text" name="field" size="40" value="<%=field %>"></td>
</tr>
<%
}
%>
<tr>
<td colspan="2" id="btn">
<input type="button" value="목록" class="a">
<input type="button" value="수정" onclick="javascript:check()" class="a">
</td>
</tr>
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main화면</title>
<script type="text/javascript">
function check() {
	if(document.lecurer.name.value==""){
		alert("강사이름를 입력하세요.");
		document.lecurer.name.focus();
	}else if(document.lecurer.major.value==""){
		alert("전공을 입력하세요.");
		document.lecurer.major.focus();
	}else if(document.lecurer.field.value==""){
		alert("세부전공을 입력하세요.");
		document.lecurer.field.focus();
	}else{
		document.lecurer.submit();
	}
}
</script>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<br/><h2>강사 추가</h2>
<form  name="lecurer" method="post" action="lecturerProcess.jsp">
<table border="1" id="tbn_i4">
<%
PreparedStatement pstmt=null;
ResultSet rs=null;
int idxa=0;

String sql="select max(idx) from lecturer0923";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();

if(rs.next()){
	idxa = rs.getInt(1)+1;
}
%>
<tr>
<th class="tbn3">강사코드</th>
<td><input type="text" name="idx" size="40" value="<%=idxa %>"></td>
</tr>

<tr>
<th class="tbn3">강사명</th>
<td><input type="text" name="name" size="40"></td>
</tr>

<tr>
<th class="tbn3">전공</th>
<td><input type="text" name="major" size="40"></td>
</tr>

<tr>
<th class="tbn3">세부전공</th>
<td><input type="text" name="field" size="40"></td>
</tr>

<tr>
<td colspan="2" id="tbn_i2">
<a href="lecturerSelect.jsp"><input type="button" value="목록" class="btn_i1" ></a>
<input type="button" value="등록" class="btn_i1" onclick="javascript:check()">
</td>
</tr>
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
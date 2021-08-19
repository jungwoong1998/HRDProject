<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성적입력</title>
<script type="text/javascript">
function check() {
	if(document.form.name.value==""){
		alert("성명이 입력되지않았습니다.");
		document.form.name.focus();
	}else if(document.form.id.value==""){
		alert("사번이 입력되지 않았습니다.");
		document.form.id.focus();
	}else if(document.form.dept.value==""){
		alert("부서가 선택되지 않았습니다.");
		document.form.dept.focus();
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
<h2>인사관리 사원 등록 화면</h2><hr>
<form name="form" method="post" action="person_process.jsp">
<table border="2" id="person_insert">
<tr>
<th>성명</th>
<td><input type="text" name="name" size="40"></td>
</tr>

<%
PreparedStatement pstmt=null;
ResultSet rs=null;
int ida=0;

String sql="select max(id) from person0818";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();

if(rs.next()){
	ida=rs.getInt(1)+1;
}
%>
<tr>
<th>사원번호</th>
<td><input type="text" name="id" value="<%=ida %>" size="40"></td>
</tr>

<tr>
<th>소속부서</th>
<td><select name="dept">
<option value='인사부'>인사부</option>
<option value='기획부'>기획부</option>
<option value='홍보부'>홍보부</option>
<option value='영업부'>영업부</option>
<option value='경리부'>경리부</option>
</select>
</td>
</tr>

<tr>
<th>직급</th>
<td><select name="position">
<option value='1'>1급</option>
<option value='2'>2급</option>
<option value='3'>3급</option>
<option value='4'>4급</option>
</select>
</td>
</tr>

<tr>
<th>직책</th>
<td><input type="text" name="duty" size="40"></td>
</tr>

<tr>
<th>성명</th>
<td><input type="text" name="phone" size="40"></td>
</tr>

<tr>
<td colspan="2" id="insert_btn">
<input type="button" value="등 록" onclick="javascript:check()" class="insert_btn">
<a href="index.jsp"><input type="button" value="취 소" class="insert_btn"></a>
</td>
</tr>
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
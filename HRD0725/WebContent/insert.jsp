<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성적입력</title>
</head>
<body>
<header><%@include file = "header.jsp" %></header>
<nav><%@include file = "nav.jsp" %></nav>
<section>
<%@include file = "dbconn.jsp" %>
<h2>인사관리 사원 등록 화면</h2>
<form name="form" method="post" action="insert_process.jsp">
<table border="1">

<tr>
<th>성명</th>
<td><input type="text" name="name" size="30"></td>
</tr>

<tr>
<th>사원번호</th>
<td><input type="text" name="id" size = "30"></td>
</tr>

<tr>
<th>소속부서</th>
<td><select name="dept">
<option value="인사부">인사부</option>
<option value="기획부">기획부</option>
<option value="홍보부">홍보부</option>
<option value="영업부">영업부</option>
<option value="경리부">경리부</option>
</select>
</td>
</tr>

<tr>
<th>직급</th>
<td><select name="position">
<option value="1">1급</option>
<option value="2">2급</option>
<option value="3">3급</option>
<option value="4">4급</option>
</select>
</td>
</tr>

<tr>
<th>직책</th>
<td><input type="text" name="duty" size = "30"></td>
</tr>

<tr>
<th>연락처</th>
<td><input type="text" name="phone" size = "30"></td>
</tr>

<tr>
<td colspan="2">
<input type="button" value="등록" onclick="javascript:check()">
<a href="index.jsp"><input type="button" value="취소"></a>
</table>
</form>
</section>
<footer><%@include file = "footer.jsp" %></footer>
</body>
</html>
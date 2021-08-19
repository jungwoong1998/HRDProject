<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성적수정</title>
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
<%
PreparedStatement pstmt=null;
ResultSet rs=null;
String id = request.getParameter("id");

String sql="select * from person0818 where id=?";
pstmt=conn.prepareStatement(sql);
pstmt.setString(1, id);
rs=pstmt.executeQuery();

if(rs.next()){
	String name=rs.getString(2);
	String dept=rs.getString(3);
	String position=rs.getString(4);
	String duty=rs.getString(5);
	String phone=rs.getString(6);

%>
<h2>인사관리 사원 정보변경 화면</h2><hr>
<form name="form" method="post" action="update_person_process.jsp">
<table border="2" id="person_insert">
<tr>
<th>성명</th>
<td><input type="text" name="name" size="40" value="<%=name %>"></td>
</tr>

<tr>
<th>사원번호</th>
<td><input type="text" name="id" value="<%=id %>" size="40"></td>
</tr>

<tr>
<th>소속부서</th>
<td><select name="dept">
<option value='인사부' <%if(dept.equals("인사부")){%>selected<%} %>>인사부</option>
<option value='기획부' <%if(dept.equals("기획부")){%>selected<%} %>>기획부</option>
<option value='홍보부' <%if(dept.equals("홍보부")){%>selected<%} %>>홍보부</option>
<option value='영업부' <%if(dept.equals("영업부")){%>selected<%} %>>영업부</option>
<option value='경리부' <%if(dept.equals("경리부")){%>selected<%} %>>경리부</option>
</select>
</td>
</tr>

<tr>
<th>직급</th>
<td><select name="position">
<option value='1' <%if(position.equals("1")){%>selected<%} %>>1급</option>
<option value='2' <%if(position.equals("2")){%>selected<%} %>>2급</option>
<option value='3'<%if(position.equals("3")){%>selected<%} %>>3급</option>
<option value='4'<%if(position.equals("4")){%>selected<%} %>>4급</option>
</select>
</td>
</tr>

<tr>
<th>직책</th>
<td><input type="text" name="duty" size="40" value="<%=duty %>"></td>
</tr>

<tr>
<th>성명</th>
<td><input type="text" name="phone" size="40" value="<%=phone %>"></td>
</tr>
<% 
}
%>
<tr>
<td colspan="2" id="insert_btn">
<input type="button" value="변경" onclick="javascript:check()" class="insert_btn">
<a href="index.jsp"><input type="button" value="취 소" class="insert_btn"></a>
</td>
</tr>
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
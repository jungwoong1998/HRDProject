<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인사관리 사원정보변경</title>
<script>
function check() {
	if(document.form.name.value==""){
		alert("성명이 입력되지 않았습니다.");
		document.form.name.focus();
	}else{
		document.form.submit();
	}
}
</script>
</head>
<body>
<header><%@include file = "header.jsp" %></header>
<nav><%@include file = "nav.jsp" %></nav>
<section>
<%@include file ="dbconn.jsp" %>
<h1>인사관리 사원변경 화면</h1><hr>
<form name="form" method="post" action="info_update_process.jsp">
<table border="1" id="t1">
<%
PreparedStatement pstmt = null;
ResultSet rs= null;

String id = request.getParameter("id");


String sql = "select * from info0809 where id=?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, id);
rs = pstmt.executeQuery();

if(rs.next()){
	String name = rs.getString(2);
	String duty = rs.getString(5);
	String phone = rs.getString(6);
	String address = rs.getString(7);

%>
<tr>
<th>사원번호(자동생성)</th>
<td><input type="text" name="id" class="f1" size="30" value="<%=id%>">&nbsp 마지막번호+1</td>
</tr>

<tr>
<th>성명</th>
<td><input type="text" name="name"  class="f1" size="30" value="<%=name %>"></td>
</tr>

<tr>
<th>소속부서</th>
<td><select name="dept" class="s1" >
<option value="10">인사부</option>
<option value="20">기획부</option>
<option value="30">홍보부</option>
<option value="40">영업부</option>
<option value="50">경리부</option>
</select></td>
</tr>

<tr>
<th>직급</th>
<td>
<input type="radio" name="position" value="1" class="r1">1급
<input type="radio" name="position" value="2" class="r1">2급
<input type="radio" name="position" value="3" class="r1">3급
<input type="radio" name="position" value="4" class="r1">4급
<input type="radio" name="position" value="5" class="r1">5급
</td>
</tr>

<tr>
<th>직책</th>
<td><input type="text" name="duty"  class="f1" size="30" value="<%=duty %>" ></td>
</tr>

<tr>
<th>연락처</th>
<td><input type="text" name="phone"  class="f1" size="30" value="<%=phone %>" ></td>
</tr>

<tr>
<th>주소</th>
<td><input type="text" name="address"  class="f1" size="30" value="<%=address %>"></td>
</tr>
<% 
}
%>
<tr>
<td colspan="2" id="btn_a">
<input type="button" value="등록" onclick="javascript:check()" class="btn_a1">
<input type="reset" value="취소" class="btn_a1">
</td>
</tr>
</table>
</form><hr>
</section>
<footer><%@include file = "footer.jsp" %></footer>
</body>
</html>
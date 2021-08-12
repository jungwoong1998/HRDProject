<%@page import="oracle.jdbc.proxy.annotation.Pre"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수강신청 수정</title>
<script>
function check() {
	if(document.form.id.value==""){
		alert("교과목 코드를 입력하세요.");
		document.form.id.focus();
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
<h2>교과목 수정</h2>
<form name="form" method="post" action="update_process.jsp">
<table border="2" id="insert1">
<tr>
<%
PreparedStatement pstmt = null;
ResultSet rs = null;
String id = request.getParameter("id");

	String sql = "select * from course0812 where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		String name = rs.getString(2);
		String credit = rs.getString(3);
		String lect = rs.getString(4);
		String week = rs.getString(5);
		String start = rs.getString(6);
		String end = rs.getString(7);
%>
<th>교과목 코드</th>
<td><input type="text" name="id" size="30" value="<%=id%>"></td>
</tr>

<tr>
<th>과 목 명</th>
<td><input type="text" name="name" size="30" value="<%=name%>"></td>
</tr>

<tr>
<th>학 점</th>
<td><input type="text" name="credit" size="30" value="<%=credit%>"></td>
</tr>

<tr>
<th>담 당 강 사</th>
<td><select name="lect">
<option checked >담당강사 선택</option>
<option value="1">김교수</option>
<option value="2">이교수</option>
<option value="3">박교수</option>
<option value="4">우교수</option>
<option value="5">최교수</option>
<option value="6">강교수</option>
<option value="7">황교수</option>
</select>
</td>
</tr>

<tr>
<th>요 일</th>
<td class="ra1">
<input type="radio" style="vertical-align:-4px" name="week" value="1" checked> 월
<input type="radio" style="vertical-align:-4px" name="week" value="2" > 화
<input type="radio" style="vertical-align:-4px" name="week" value="3" > 수
<input type="radio" style="vertical-align:-4px" name="week" value="4" > 목
<input type="radio" style="vertical-align:-4px" name="week" value="5" > 금
<input type="radio" style="vertical-align:-4px" name="week" value="6" > 토
</td>
</tr>

<tr>
<th>시 작</th>
<td><input type="text" name="start" size="30" value="<%=start%>"></td>
</tr>

<tr>
<th>종 료</th>
<td><input type="text" name="end" size="30" value="<%=end%>"></td>
</tr>
<%
}
%>
<tr>
<td colspan="2" id="btn_in">
<a href="course_select.jsp"><input type="button" value="목록" class="btn_i"></a>
<input type="button" value="수정" class="btn_i" onclick="javascript:check()">
</td>
</tr>
</table>
</form>
</section>
<footer><%@include file ="footer.jsp" %></footer>
</body>
</html>
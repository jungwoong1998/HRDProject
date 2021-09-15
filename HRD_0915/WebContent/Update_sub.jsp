<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>교과목 수정</title>
<script>
function check() {
	if(document.form.id.value==""){
		alert("교과목 코드가 입력되지 않았습니다.");
		document.form.id.focus();
	}else if(document.form.subject_name.value==""){
		alert("교과목명이 입력되지 않았습니다.");
		document.form.subject_name.focus();
	}else if(document.form.credit.value==""){
		alert("학점이 입력되지 않았습니다.");
		document.form.credit.focus();
	}else if(document.form.lecturer.value==""){
		alert("담당강사가 입력되지 않았습니다.");
		document.form.lecturer.focus();
	}else if(document.form.start_hour.value==""){
		alert("시작시간이 입력되지 않았습니다.");
		document.form.start_hour.focus();
	}else if(document.form.end_hour.value==""){
		alert("종료시간이 입력되지 않았습니다.");
		document.form.end_hour.focus();
	}
	else{
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
<h2 style="font-family: sans-serif;" align="center">교과목 수정</h2>
<form name="form" method="post" action="subProcess_re.jsp">
<table border="3" id="forn" style="margin: 0 auto; width: 600px; height: 200px; font-weight: 600;">
<%
PreparedStatement pstmt=null;
ResultSet rs = null;

String id = request.getParameter("id");

String sql = "select * from sub0915 where id=?";
pstmt=conn.prepareStatement(sql);
pstmt.setString(1, id);
rs = pstmt.executeQuery();

if(rs.next()){
	String subject_name = rs.getString(2);
	String credit = rs.getString(3);
	String lecturer = rs.getString(4);
	String week = rs.getString(5);
	String start_hour = rs.getString(6);
	String end_hour = rs.getString(7);

%>
<tr>
<th>교과목 코드</th>
<td><input type="text" name="id" size="40" value="<%=id%>"></td>
</tr>

<tr>
<th>성명</th>
<td><input type="text" name="subject_name" size="40" value="<%=subject_name%>" ></td>
</tr>

<tr>
<th>학 점</th>
<td><input type="text" name="credit" size="40" value="<%=credit%>"></td>
</tr>

<tr>
<th>담 당 강 사</th>
<td><select name="lecturer" style="width: 150px; height: 20px;">
<option value="">담당강사 선택</option>
<option value="1" <%if(lecturer.equals("1")){%>selected<%}%> >김교수</option>
<option value="2" <%if(lecturer.equals("2")){%>selected<%}%> >이교수</option>
<option value="3" <%if(lecturer.equals("3")){%>selected<%}%> >박교수</option>
<option value="4" <%if(lecturer.equals("4")){%>selected<%}%> >우교수</option>
<option value="5" <%if(lecturer.equals("5")){%>selected<%}%> >최교수</option>
<option value="6" <%if(lecturer.equals("6")){%>selected<%}%> >강교수</option>
<option value="7" <%if(lecturer.equals("7")){%>selected<%}%> >황교수</option>
</select></td>
</tr>

<tr>
<th>요일</th>
<td>
<input type="radio" name="week" value="1" <%if(week.equals("1")){%>checked<%} %> style="vertical-align: -2px;" checked> 월
<input type="radio" name="week" value="2" <%if(week.equals("2")){%>checked<%} %> style="vertical-align: -2px;"> 화
<input type="radio" name="week" value="3" <%if(week.equals("3")){%>checked<%} %> style="vertical-align: -2px;"> 수
<input type="radio" name="week" value="4" <%if(week.equals("4")){%>checked<%} %> style="vertical-align: -2px;"> 목
<input type="radio" name="week" value="5" <%if(week.equals("5")){%>checked<%} %> style="vertical-align: -2px;"> 금
<input type="radio" name="week" value="6" <%if(week.equals("6")){%>checked<%} %> style="vertical-align: -2px;"> 토
</td>
</tr>

<tr>
<th>시 작</th>
<td><input type="text" name="start_hour" size="40" value="<%=start_hour%>"></td>
</tr>

<tr>
<th>종 료</th>
<td><input type="text" name="end_hour" size="40" value="<%=end_hour%>"></td>
</tr>
<%
}
%>
<tr>
<td colspan="2" id="btn">
<input type="button" value="목록" class="a">
<input type="button" value="등록"  onclick="javascript:check()" class="a">
</td>
</tr>
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
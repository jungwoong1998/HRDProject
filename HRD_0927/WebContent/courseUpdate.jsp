<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main화면</title>
<script type="text/javascript">
function check() {
	if(document.course.id.value==""){
		alert("교과목 코드가 입력되지 않았습니다.");
		document.course.id.focus();
	}else if(document.course.name.value==""){
		alert("교과목명이 입력되지 않았습니다.");
		document.course.name.focus();
	}else if(document.course.credit.value==""){
		alert("학점이 입력되지 않았습니다.");
		document.course.credit.focus();
	}else if(document.course.lecturer.value==""){
		alert("담당강사가 입력되지 않았습니다.");
		document.course.lecturer.focus();
	}else if(document.course.start_hour.value==""){
		alert("시작시간이 입력되지 않았습니다.");
		document.course.start_hour.focus();
	}else if(document.course.end_end.value==""){
		alert("종료시간이 입력되지 않았습니다.");
		document.course.end_end.focus();
	}else{
		document.course.submit();
	}
}
</script>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<br/><h2>교과목 수정</h2>
<form name="course" method="post" action="courseProcess_Update.jsp">
<table border="1" id="tbn_i1">
<%
PreparedStatement pstmt=null;
ResultSet rs=null;
String id = request.getParameter("id");

String sql = "select * from course0923 where id=?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, id);
rs=pstmt.executeQuery();

if(rs.next()){
	String name = rs.getString(2);
	String credit = rs.getString(3);
	String lecturer = rs.getString(4);
	String week = rs.getString(5);
	String start_hour = rs.getString(6);
	String end_end = rs.getString(7);

%>
<tr>
<th class="tbn1">교과목 코드</th>
<td><input type="text" name="id" size="30" value="<%=id %>"></td>
</tr>

<tr>
<th class="tbn1">과 목 명</th>
<td><input type="text" name="name"  size="30" value="<%=name %>"></td>
</tr>

<tr>
<th class="tbn1">학 점</th>
<td><input type="text" name="credit"  size="30" value="<%=credit %>"></td>
</tr>

<tr>
<th class="tbn1">담 당 강 사</th>
<td><select name="lecturer">
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
<th class="tbn1">요 일</th>
<td>
<input type="radio" name="week" value="1" style="vertical-align: -8px" <%if(week.equals("1")){%>checked<%}%>> 월
<input type="radio" name="week" value="2" style="vertical-align: -8px" <%if(week.equals("2")){%>checked<%}%>> 화
<input type="radio" name="week" value="3" style="vertical-align: -8px" <%if(week.equals("3")){%>checked<%}%>> 수
<input type="radio" name="week" value="4" style="vertical-align: -8px" <%if(week.equals("4")){%>checked<%}%>> 목
<input type="radio" name="week" value="5" style="vertical-align: -8px" <%if(week.equals("5")){%>checked<%}%>> 금
<input type="radio" name="week" value="6" style="vertical-align: -8px" <%if(week.equals("6")){%>checked<%}%>> 토
</td>
</tr>

<tr>
<th class="tbn1">시 작</th>
<td><input type="text" name="start_hour"  size="30" value="<%=start_hour %>"></td>
</tr>

<tr>
<th class="tbn1">종 료</th>
<td><input type="text" name="end_end"  size="30" value="<%=end_end %>"></td>
</tr>
<%
}
%>

<tr>
<td colspan="2" id="tbn_i2">
<a href="courseSelect.jsp"><input type="button" value="목록" class="btn_i1"></a>
<input type="button" value="등록" onclick="javascript:check()" class="btn_i1">
</td>
</tr>

</table>
</form>

</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
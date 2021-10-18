<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강사정보 추가</title>
<script type="text/javascript">
	function check() {
		if(form.studno.value==""){
			alert("학번이 입력되지 않았습니다.");
			form.studno.focus();
			return false;
		}
		if(form.name.value==""){
			alert("이름이 입력되지 않았습니다.");
			form.name.focus();
			return false;
		}
		form.submit();
		alert("등록이 완료되었습니다!");
	}
</script>
</head>
<body>
<header><%@include file = "header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<br/><h2>강사 추가</h2>
<form name="form" method="post" action="Insert_LecturerProcess.jsp">
<table border="1" id="t2">
<%
PreparedStatement pstmt = null;
ResultSet rs = null;
int idxa = 0;

String sql = "select teacher1009_seq.nextval from dual";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

if(rs.next()){
	idxa = rs.getInt(1);
}
%>
<tr>
<th class="in3">강사 ID</th>
<td><input type="text" name="idx" size="40" value="<%=idxa %>"></td>
</tr>

<tr>
<th class="in3">강 사 명</th>
<td><input type="text" name="name" size="40"></td>
</tr>

<tr>
<th class="in3">전 공</th>
<td><input type="text" name="major" size="40"></td>
</tr>

<tr>
<th class="in3">세부 전공</th>
<td><input type="text" name="field" size="40"></td>
</tr>

<tr>
<td colspan="2" id="btn">
<a href="Select_Lecturer.jsp"><input type="button" value="목록" class="btn1"></a>
<input type="button" value="등록" onclick="javascript:check()" class="btn1">
</td>
</tr>
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
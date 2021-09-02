<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호봉변경 화면</title>
<style>
h1{text-align: center; font-weight: 600;}
#in_t{margin: 0 auto;  width: 600px; height: 100px;}
input,text{height: 30px;}
#btn_i{text-align: center;}
.btn_a{width: 90px; height: 30px; font-size: 12pt;}
</style>
<script type="text/javascript">
function check() {
	if(document.form.dunggub.value==""){
		alert("직급을 선택해주세요.");
		document.form.dunggub.focus();
	}else if(document.form.salary.value==""){
		alert("급여를 입력해주세요.");
		document.form.salary.focus();
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
<h1>인사관리 호봉 변경 화면</h1><hr/>
<form name="form" method="post" action="hobong_updateProcess.jsp">
<table border="2" id="in_t" width="800px;" height="300px;">
<%
PreparedStatement pstmt=null;
ResultSet rs = null;

String dunggub = request.getParameter("dunggub");

String sql = "select * from hobong0902 where dunggub=?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, dunggub);
rs = pstmt.executeQuery();

if(rs.next()){
	String salary = rs.getString(2);

%>
<tr>
<th style="background-color: #E6E6E6;">직급</th>
<td><select name="dunggub" style="width: 150px; height: 30px">
<option value="10" <%if(dunggub.equals("10")){%>selected<%} %>>1급</option>
<option value="20" <%if(dunggub.equals("20")){%>selected<%} %>>2급</option>
<option value="30" <%if(dunggub.equals("30")){%>selected<%} %>>3급</option>
<option value="40" <%if(dunggub.equals("40")){%>selected<%} %>>4급</option>
<option value="50" <%if(dunggub.equals("50")){%>selected<%} %>>5급</option>
</select></td>
</tr>

<tr>
<th style="background-color: #E6E6E6;">급여</th>
<td><input type="text" name="salary" size="40" value="<%=salary %>"></td>
</tr>
<%
}
%>
<tr>
<td colspan="4" id="btn_i">
<input type="button" value="변경"  class="btn_a" onclick="javascript:check()">
<a href="index.jsp"><input type="button" value="취소" class="btn_a"></a>
</td>
</tr>
</table><hr/>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
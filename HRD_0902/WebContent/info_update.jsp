<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원변경 화면</title>
<style>
h1{text-align: center; font-weight: 600;}
#in_t{margin: 0 auto;}
input,text{height: 20px;}
#btn_i{text-align: center;}
.btn_a{width: 90px; height: 20px; font-size: 12pt;}
</style>
<script type="text/javascript">
function check() {
	if(document.form.name.value==""){
		alert("성명을 입력해주세요.");
		document.form.name.focus();
	}else if(document.form.dept.value==""){
		alert("소속부서를 선택해주세요.");
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
<br/>
<h1>인사관리 사원변경 화면</h1><hr/>
<form name="form" method="post" action="info_updateProcess.jsp">
<table border="2" id="in_t" width="800px;" height="300px;">
<tr>
<th>사원번호</th>
<%
PreparedStatement pstmt = null;
ResultSet rs = null;
String id = request.getParameter("id");

String sql = "select * from info0902 where id=?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, id);
rs = pstmt.executeQuery();

if(rs.next()){
	String name = rs.getString(2);
	String dept = rs.getString(3);
	String position = rs.getString(4);
	String duty = rs.getString(5);
	String phone = rs.getString(6);
	String address = rs.getString(7);

%>
<td><input type="text" name="id" size="40" value="<%=id %>"></td>
</tr>

<tr>
<th>성명</th>
<td><input type="text" name="name" size="40" value="<%=name%>"></td>
</tr>

<tr>
<th>소속부서</th>
<td><select name="dept" style="width: 150px; height: 20px">
<option value="10" <%if(dept.equals("10")){%>selected<%} %>>인사부</option>
<option value="20" <%if(dept.equals("20")){%>selected<%} %>>기획부</option>
<option value="30" <%if(dept.equals("30")){%>selected<%} %>>홍보부</option>
<option value="40" <%if(dept.equals("40")){%>selected<%} %>>영업부</option>
<option value="50" <%if(dept.equals("50")){%>selected<%} %>>경리부</option>
</select></td>
</tr>

<tr>
<th>직급</th>
<td><select name="position" style="width: 150px; height: 20px">
<option value="1" <%if(position.equals("1")){%>selected<%} %>>1급</option>
<option value="2" <%if(position.equals("2")){%>selected<%} %>>2급</option>
<option value="3" <%if(position.equals("3")){%>selected<%} %>>3급</option>
<option value="4" <%if(position.equals("4")){%>selected<%} %>>4급</option>
<option value="5" <%if(position.equals("5")){%>selected<%} %>>5급</option>
</select></td>
</tr>

<tr>
<th>직책</th>
<td><input type="text" name="duty" size="40" value="<%=duty %>"></td>
</tr>

<tr>
<th>연락처</th>
<td><input type="text" name="phone" size="40" value="<%=phone %>"></td>
</tr>

<tr>
<th>주소</th>
<td><input type="text" name="address" size="40" value="<%=address %>"></td>
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
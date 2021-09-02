<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원등록 화면</title>
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
<h1>인사관리 사원등록 화면</h1><hr/>
<form name="form" method="post" action="infoProcess.jsp">
<table border="2" id="in_t" width="800px;" height="300px;">
<tr>
<th>사원번호(자동생성)</th>
<%
PreparedStatement pstmt = null;
ResultSet rs = null;
int idx=0;

String sql = "select max(id) from info0902";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

if(rs.next()){
	idx = rs.getInt(1)+1;
}
%>
<td><input type="text" name="id" size="40" value="<%=idx %>">마지막 번호+1</td>
</tr>

<tr>
<th>성명</th>
<td><input type="text" name="name" size="40"></td>
</tr>

<tr>
<th>소속부서</th>
<td><select name="dept" style="width: 150px; height: 20px">
<option value="10">인사부</option>
<option value="20">기획부</option>
<option value="30">홍보부</option>
<option value="40">영업부</option>
<option value="50">경리부</option>
</select></td>
</tr>

<tr>
<th>직급</th>
<td><select name="position" style="width: 150px; height: 20px">
<option value="1">1급</option>
<option value="2">2급</option>
<option value="3">3급</option>
<option value="4">4급</option>
<option value="5">5급</option>
</select></td>
</tr>

<tr>
<th>직책</th>
<td><input type="text" name="duty" size="40"></td>
</tr>

<tr>
<th>연락처</th>
<td><input type="text" name="phone" size="40"></td>
</tr>

<tr>
<th>주소</th>
<td><input type="text" name="address" size="40"></td>
</tr>

<tr>
<td colspan="4" id="btn_i">
<input type="button" value="등록"  class="btn_a" onclick="javascript:check()">
<a href="index.jsp"><input type="button" value="취소" class="btn_a"></a>
</td>
</tr>
</table><hr/>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
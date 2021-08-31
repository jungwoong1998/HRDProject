<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 등록</title>
<script type="text/javascript">
function check() {
	if(document.form.id.value==""){
		alert("아이디를 입력하세요.");
		document.form.id.focus();
	}else if(document.form.name.value==""){
		alert("이름을 입력하세요.");
		document.form.name.focus();
	}else if(document.form.password.value==""){
		alert("비밀번호를 입력하세요.");
		document.form.password.focus();
	}else{
		document.form.submit();
	}
}
function idck() {
		document.form.submit();
}
</script>
<style>
h1{text-align: center;}
#in_t{margin: 0 auto; width: 800px; height: 400px;}
input,text{height: 30px;}
select,phone1{height: 30px; width: 80px;}
select,email1{height: 30px; width: 100px;}
</style>
</head>
<body>
<header><%@include file = "header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<h1>회원 정보 등록 화면</h1><hr/>
<form name="form" method="post" action="insert_member.jsp">
<table border="1" id="in_t">
<tr>
<th>아이디</th>
<%
PreparedStatement pstmt=null;
ResultSet rs = null;
String id = request.getParameter("id");

String sql = "select * from member0831 where id=?";
pstmt=conn.prepareStatement(sql);
pstmt.setString(1, id);
rs=pstmt.executeQuery();

if(rs.next()){
	%>
	<script>
	alert("이미 등록된 아이디 입니다.");
	</script>
	<%
}
%>
<td><input type="text" name="id" size="30" onchange="idck()"></td>
</tr>

<tr>
<th>이름</th>
<td><input type="text" name="name" size="30"></td>
</tr>

<tr>
<th>비밀번호</th>
<td><input type="text" name="password" size="30"></td>
</tr>

<tr>
<th>성별</th>
<td>
<input type="radio" name="gender" value="남성" size="30">남
<input type="radio" name="gender" value="여성" size="30">여
</td>
</tr>

<tr>
<th>생년월일</th>
<td><input type="text" name="birth" size="20"></td>
</tr>

<tr>
<th>이메일</th>
<td>
<input type="text" name="email1" size="30">@
<select name="email2">
<option value="naver.com">naver.com</option>
<option value="gmail.com">gmail.com</option>
<option value="hanmail.net">hanmail.net</option>
</select>
</td>
</tr>

<tr>
<th>휴대폰</th>
<td>
<select name="phone1">
<option value="010">010</option>
<option value="011">011</option>
<option value="019">019</option>
</select>-
<input type="text" name="phone2" size="10">-
<input type="text" name="phone3" size="10">
</td>
</tr>

<tr>
<th>주소</th>
<td><input type="text" name="id" size="50"></td>
</tr>

<tr>
<th>닉네임</th>
<td><input type="text" name="id" size="30"></td>
</tr>

<tr>
<td colspan="2">
<input type="button" value="회원등록" onclick="javascript:check()">
<input type="reset" value="다시작성">
</td>
</tr>
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
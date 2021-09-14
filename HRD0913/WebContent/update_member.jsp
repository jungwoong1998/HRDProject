<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "java.sql.*" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member_update</title>
<script>
function check() {
	if(document.form.custname.value==""){
		alert("회원성명이 입력되지 않았습니다.");
		document.form.custname.focus();
	}else if(document.form.phone.value==""){
		alert("회원전화가 입력되지 않았습니다.");
		document.form.phone.focus();
	}else if(document.form.address.value==""){
		alert("회원주소가 입력되지 않았습니다.");
		document.form.address.focus();
	}else if(document.form.joindate.value==""){
		alert("가입일자가 입력되지 않았습니다.");
		document.form.joindate.focus();
	}else if(document.form.grade.value==""){
		alert("고객등급이 입력되지 않았습니다.");
		document.form.grade.focus();
	}else if(document.form.city.value==""){
		alert("도시코드가 입력되지 않았습니다.");
		document.form.city.focus();
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
<%@include file = "DBconn.jsp" %>
<br/>
<h2>홈쇼핑 회원 등록</h2><br/>
<form name="form" method="post" action="update_memberProcess.jsp">
<table border="1" id="table_a">
<%
PreparedStatement pstmt = null;
ResultSet rs = null;
String custno = request.getParameter("custno");

String sql = "select custno,custname,phone,address,to_char(joindate,'yyyy-mm-dd'),grade,city  from  member0913 where custno=?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, custno);
rs=pstmt.executeQuery();

if(rs.next()){
	String custname = rs.getString(2);
	String phone = rs.getString(3);
	String address = rs.getString(4);
	String joindate = rs.getString(5);
	String grade = rs.getString(6);
	String city = rs.getString(7);

%>
<tr>
<th>회원번호(자동발생)</th>
<td><input type="text" name="custno" value="<%=custno %>" size="10"></td>
</tr>

<tr>
<th>회원성명</th>
<td><input type="text" name="custname" size="10" value="<%=custname %>"></td>
</tr>

<tr>
<th>회원전화</th>
<td><input type="text" name="phone" size="20" value="<%=phone %>"></td>
</tr>

<tr>
<th>회원주소</th>
<td><input type="text" name="address" size="30" value="<%=address %>"></td>
</tr>

<tr>
<th>가입일자</th>
<td><input type="text" name="joindate" size="10" value="<%=joindate %>"></td>
</tr>

<tr>
<th>고객등급 [ A:VIP,B:일반,C:직원]</th>
<td><input type="text" name="grade" size="10" value="<%=grade %>"></td>
</tr>

<tr>
<th>도시코드</th>
<td><input type="text" name="city" size="10" value="<%=city %>"></td>
</tr>
<%
}
%>
<tr>
<td colspan="2" id="btn">
<input type="button" value="수정" onclick="javascript:check()">
<a href="select_member.jsp"><input type="button" value="조회"></a>
</td>
</tr>
</table>
</form>
</section>
<footer><%@include file = "footer.jsp" %></footer>
</body>
</html>
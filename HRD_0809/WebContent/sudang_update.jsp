<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수당 정보 변경</title>
<script>
function check() {
	if(document.form.id.value==""){
		alert("사번이 입력되지 않았습니다.");
		document.form.id.focus();
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
<h1>수당 정보 변경</h1><hr>
<form name="form" method="post" action="sudang_update_process.jsp">
<table border="1" id="t1">
<%
PreparedStatement pstmt = null;
ResultSet rs= null;

String id = request.getParameter("id");


String sql = "select * from sudnag0809 where id=?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, id);
rs = pstmt.executeQuery();


if(rs.next()){
	String gajok = rs.getString(2);
	String jikchak = rs.getString(3);
	String gunsok = rs.getString(4);
	String gitasudang = rs.getString(5);

%>
<tr>
<th>사원번호</th>
<td><input type="text" name="id" class="f1" size="30" value="<%=id%>"></td>
</tr>

<tr>
<th>가족수당</th>
<td><input type="text" name="gajok"  class="f1" size="30" value="<%=gajok %>" ></td>
</tr>

<tr>
<th>직책수당</th>
<td><input type="text" name="jikchak"  class="f1" size="30" value="<%=jikchak %>" ></td>
</tr>

<tr>
<th>근속수당</th>
<td><input type="text" name="gunsok"  class="f1" size="30" value="<%=gunsok %>" ></td>
</tr>

<tr>
<th>기타수당</th>
<td><input type="text" name="gitasudang"  class="f1" size="30" value="<%=gitasudang %>" ></td>
</tr>
<% 
}
System.out.println(id);
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
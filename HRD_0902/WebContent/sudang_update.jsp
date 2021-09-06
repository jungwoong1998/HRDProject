<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수당정보 수정</title>
<style>
h1{text-align: center; font-weight: 600; font-family: 'hy견고딕'; line-height: 60px;}
#in_t{margin: 0 auto;  width: 650px; height: 100px;}
input,text{height: 30px;}
#btn_i{text-align: center;}
.btn_a{width: 90px; height: 30px; font-size: 12pt;}
</style>
<script type="text/javascript">
function check() {
	if(document.form.id.value==""){
		alert("사원번호를 입력하세요");
		document.form.id.focus();
	}else if(document.form.gajok.value==""){
		alert("가족수당을 입력하세요.");
		document.form.gajok.focus();
	}else if(document.form.jikchak.value==""){
		alert("직책수당을 입력하세요.");
		document.form.jikchak.focus();
	}else if(document.form.gunsok.value==""){
		alert("근속수당을 입력하세요.");
		document.form.gunsok.focus();
	}else if(document.form.gitasudang.value==""){
		alert("기타수당을 입력하세요.");
		document.form.gitasudang.focus();
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
<h1>수당 정보 등록</h1><br/>
<form name="form" method="post" action="sudang_updateProcess.jsp">
<table border="1" id="in_t">
<%
PreparedStatement pstmt=null;
ResultSet rs = null;
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");

String sql = "select * from sudang0902 where id=?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, id);
rs = pstmt.executeQuery();
// 지역변수는 tr이 시작하기 전에 끝내야 테이블을 불러올수 있음
//if 다음 사원번호가 없을때 스크립트가 작동해야 되므로 else를 사용.
if(rs.next()){
	String gajok = rs.getString(2);
	String jikchak = rs.getString(3);
	String gunsok = rs.getString(4);
	String gitasudang = rs.getString(5);
%>
<tr>
<th style="width: 100px; background-color: #F5F6CE">사원번호</th>
<td colspan="4"><input type="text" name="id" size="50"  value="<%=id%>"></td>
</tr>

<tr>
<th style="width: 100px; background-color: #F5F6CE">가족수당</th>
<td><input type="text" name="gajok" size="20" value="<%=gajok%>"></td>

<th style="width: 100px; background-color: #F5F6CE">직책수당</th>
<td><input type="text" name="jikchak" size="20" value="<%=jikchak%>"></td>
</tr>

<tr>
<th style="width: 100px; background-color: #F5F6CE">근속수당</th>
<td colspan="4"><input type="text" name="gunsok" value="<%=gunsok%>" size="30"></td>
</tr>

<tr>
<th style="width: 100px; background-color: #F5F6CE">기타수당</th>
<td colspan="4"><input type="text" name="gitasudang" value="<%=gitasudang%>" size="30"></td>
</tr>
<%
}
%>
<tr>
<td colspan="4" id="btn_i">
<input type="button" value="목록" class="btn_a">
<input type="submit" value="수정" class="btn_a" onclick="javascript:check()">
</td>
</tr>
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
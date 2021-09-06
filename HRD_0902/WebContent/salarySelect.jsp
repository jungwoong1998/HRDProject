<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>급여 정보 조회</title>
<style type="text/css">
#select_t{margin: 0 auto; width: 900px; height: 100px;}
h1{text-align: center; font-family: 'HY견고딕';}
</style>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<br/>
<h1>수당 정보 조회</h1><hr/>
<table border="2" id="select_t">
<tr>
<th>no</th> <th>사원번호</th> <th>이름</th> <th>급여</th> <th>가족수당</th> <th>직책수당</th> <th>근속수당</th> 
<th>기타수당</th> <th>급여합계</th>
</tr>
<%
PreparedStatement pstmt = null;
ResultSet rs = null;
int no=0;
String total;
try{
	String sql = "select b.id,a.name,to_char(c.salary,'9,999,999'),to_char(b.gajok,'999,999'),to_char(b.jikchak,'999,999'),to_char(b.gunsok,'999,999'),to_char(b.gitasudang,'999,999'),to_char((c.salary+b.gajok+b.jikchak+b.gunsok+b.gitasudang),'9,999,999') from info0902 a,sudang0902 b,hobong0902 c where a.id=b.id and c.dunggub=a.dept";
	pstmt = conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	while(rs.next()){
		String id = rs.getString(1);
		String name = rs.getString(2);
		String salary = rs.getString(3);
		String gajok = rs.getString(4);
		String jikchak = rs.getString(5);
		String gunsok = rs.getString(6);
		String gitasudang = rs.getString(7);
        total = rs.getString(8);
		no++;
		%>
		<tr>
		<td align="center"><%=no %></td>
		<td align="center"><%=id %></td>
		<td align="center"><%=name %></td>
		<td align="right"><%=salary %></td>
		<td align="right"><%=gajok %></td>
		<td align="right"><%=jikchak %></td>
		<td align="right"><%=gunsok %></td>
		<td align="right"><%=gitasudang %></td>
		<td align="right"><%=total %></td>
		</tr>
		<%
	}
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
</table><hr/>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
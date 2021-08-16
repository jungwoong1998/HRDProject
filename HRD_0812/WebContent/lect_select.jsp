<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강사 목록</title>
</head>
<body>
<header><%@include file = "header.jsp" %></header>
<nav><%@include file ="nav.jsp" %></nav>
<section>
<%@include file = "dbconn.jsp" %>
<h2>강사 목록</h2>
<%
PreparedStatement pstmt = null;
ResultSet rs = null;
int num=0;

String sql = "select count(idx) from lecturer0812";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

if(rs.next()){
	num = rs.getInt(1);
}
%>
<p>총 <%=num %>명의 강사가 있습니다.</p><hr>
<table border="3" id="lect">
<tr class="lect1">
<th>강사코드</th> <th>강사명</th> <th>전공</th> <th>세부전공</th>
<th>관리</th>
</tr>
<%
try{
	sql = "select * from lecturer0812";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		String idx = rs.getString(1);
		String name = rs.getString(2);
		String major = rs.getString(3);
		String field = rs.getString(4);
		%>
		<tr>
		<td class="lect2" style="width: 200px;"><%=idx %></td>
		<td class="lect2" style="width: 300px;"><%=name %></td>
		<td class="lect2"><%=major %></td>
		<td class="lect2" style="width: 250px;"><%=field %></td>
		<td class="lect2"><!--수정/삭제 링크걸때 jsp확장자 다음 해당 테이블의 기본키를 명시해야 수정문/삭제문에서 키값을 가져올수 있음.  -->
		<a href="update_lect.jsp?idx=<%=idx%>">수정</a> / 
		<a href="delete_lect.jsp?idx=<%=idx%>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a>
		</tr>
		<%
	}
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
<a href="lect_insert.jsp"><button id="stu" class="btn">작성</button></a>
</table>
</section>
<footer><%@include file = "footer.jsp" %></footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강사 조회</title>
</head>
<body>
<header><%@include file = "header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<br/><h2>강사 목록</h2>
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int cnt=0;
	
		String sql = "select count(*) from teacher1009";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
	if(rs.next()){
		cnt = rs.getInt(1);
	}
%>
<p style="padding-left: 28%;">총 <%=cnt %>명의 강사가 있습니다.</p><hr/>
<table border="3" id="t1">
<tr class="in2">
<th>강사코드</th> <th>강사명</th> <th>전공</th> <th>세부전공</th> <th>관리</th>
</tr>
<%
	pstmt = null;
	rs = null;
	
	try{
		sql = "select * from teacher1009 order by idx asc";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			String idx = rs.getString(1);
			String name = rs.getString(2);
			String major = rs.getString(3);
			String field = rs.getString(4);
			%>
			<tr>
			<td class="in1"><%=idx %></td>
			<td class="in1"><%=name %></td>
			<td class="in1"><%=major %></td>
			<td class="in1"><%=field %></td>
			<td class="in1"><a href="Update_Lecturer.jsp?idx=<%=idx%>">수정</a> / <a href="Delete_Lecturer.jsp?idx=<%=idx%>" onclick="if(!confirm('정말로 삭제하겠습니까?')) return false;">삭제</a></td>
			</tr>
			<%
		}
	}catch(SQLException e){
		e.printStackTrace();
		System.out.println("조회실패");
	}
%>
</table>
<button id="bt3" class="bt2">작성</button>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
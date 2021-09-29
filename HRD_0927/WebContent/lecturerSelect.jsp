<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main화면</title>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<br/><h2>강사 목록</h2>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int num=0;

	String sql="select count(*) from lecturer0923";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();

	if(rs.next()){
		num = rs.getInt(1);
	}
%>
<p style="padding-left: 19%;">총 <%=num %>명의 강사가 있습니다.</p><hr/>
<table border="3" id="tbn_s2">
<tr class="tbn_1">
<th>강사코드</th> <th>강사명</th> <th>전공</th> <th>세부전공</th> <th>관리</th>
</tr>
<%
	pstmt=null;
	rs=null;
try{
	sql="select * from lecturer0923 order by idx asc";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	while(rs.next()){
		String idx = rs.getString(1);
		String name = rs.getString(2);
		String major = rs.getString(3);
		String field = rs.getString(4);
		%>
		<tr>
		<td class="tbn_lect"><%=idx %></td> 
		<td class="tbn_lect1"><%=name %></td> 
		<td class="tbn_lect1"><%=major %></td> 
		<td class="tbn_lect1"><%=field %></td> 
		<td class="tbn_lect2"><a href="lecturerUpdate.jsp?idx=<%=idx%>">수정</a>
		 / 
		 <a href="lecturerDelete.jsp?idx=<%=idx%>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false">삭제</a></td>
		<%
	}
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
</table>
<a href="lecturerInsert.jsp"><button id="btn1">작성</button></a>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
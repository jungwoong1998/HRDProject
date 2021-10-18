<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학사정보 조회</title>
</head>
<body>
<header><%@include file = "header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<br/><h2>학사정보 목록</h2>
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int cnt=0;
	
		String sql = "select count(*) from stud1009";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
	if(rs.next()){
		cnt = rs.getInt(1);
	}
%>
<p style="padding-left: 28%;">총 <%=cnt %>명의 학사정보가 있습니다.</p><hr/>
<table border="3" id="t1">
<tr class="in2">
<th>학번</th> <th>성명</th> <th>학과</th> <th>학년</th> <th>주소</th> <th>연락처</th> <th>취미</th> <th>관리</th>
</tr>
<%
	pstmt = null;
	rs = null;
	
	try{
		sql = "select * from stud1009 order by studno asc";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			String studno = rs.getString(1);
			String name = rs.getString(2);
			String dept = rs.getString(3);
			String position = rs.getString(4);
			String address = rs.getString(5);
			String phone = rs.getString(6);
			String hobby = rs.getString(7);
			%>
			<tr>
			<td class="in1"><%=studno %></td>
			<td class="in1"><%=name %></td>
			<td class="in1"><%=dept %></td>
			<td class="in1"><%=position %></td>
			<td class="in1"><%=address %></td>
			<td class="in1"><%=phone %></td>
			<td class="in1"><%=hobby %></td>
			<td class="in1"><a href="Update_Student.jsp?studno=<%=studno%>">수정</a> / <a href="Delete_Student.jsp?studno=<%=studno%>" onclick="if(!confirm('정말로 삭제하겠습니까?')) return false;">삭제</a></td>
			</tr>
			<%
		}
	}catch(SQLException e){
		e.printStackTrace();
		System.out.println("조회실패");
	}
%>
</table>
<a href="Insert_Student.jsp"><button id="bt" class="bt1">학사정보 추가</button></a>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
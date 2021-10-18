<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>교과목 조회</title>
</head>
<body>
<header><%@include file = "header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<br/><h2>교과목 목록</h2>
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int cnt=0;
	
		String sql = "select count(*) from course1009";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
	if(rs.next()){
		cnt = rs.getInt(1);
	}
%>
<p style="padding-left: 28%;">총 <%=cnt %>개의 교과목이 있습니다.</p><hr/>
<table border="3" id="t1">
<tr class="in2">
<th>과목코드</th> <th>과목명</th> <th>학점</th> <th>담당강사</th> <th>요일</th> <th>시작시간</th> <th>종료시간</th> <th>관리</th>
</tr>
<%
	pstmt = null;
	rs = null;
	
	try{
		sql = "select * from course1009 order by id asc";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			String id = rs.getString(1);
			String name = rs.getString(2);
			String credit = rs.getString(3);
			String lecturer = rs.getString(4);
				if(lecturer.equals("1")){
					lecturer = "김교수";
				}else if(lecturer.equals("2")){
					lecturer = "이교수";
				}else if(lecturer.equals("3")){
					lecturer = "박교수";
				}else if(lecturer.equals("4")){
					lecturer = "우교수";
				}else if(lecturer.equals("5")){
					lecturer = "최교수";
				}else if(lecturer.equals("6")){
					lecturer = "강교수";
				}else if(lecturer.equals("7")){
					lecturer = "황교수";
				}
			String week = rs.getString(5);
			String start_hour = rs.getString(6);
			String end_end = rs.getString(7);
			%>
			<tr>
			<td class="in1"><%=id %></td>
			<td class="in1"><%=name %></td>
			<td class="in1"><%=credit %></td>
			<td class="in1"><%=lecturer %></td>
			<td class="in1"><%=week %></td>
			<td class="in1"><%=start_hour %></td>
			<td class="in1"><%=end_end %></td>
			<td class="in1"><a href="Update_Subject.jsp?id=<%=id%>">수정</a> / <a href="Delete_Subject.jsp?id=<%=id%>" onclick="if(!confirm('정말로 삭제하겠습니까?')) return false;">삭제</a></td>
			</tr>
			<%
		}
	}catch(SQLException e){
		e.printStackTrace();
		System.out.println("조회실패");
	}
%>
</table>
<a href="Insert_Subject.jsp"><button id="bt2" class="bt2">작성</button></a>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
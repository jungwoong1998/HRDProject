<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>교과목 조회</title>
</head>
<body>
<header><%@include file = "header.jsp" %></header>
<nav><%@include file ="nav.jsp" %></nav>
<section>
<%@include file = "dbconn.jsp" %>
<h2>교과목 목록</h2>
<%
PreparedStatement pstmt = null;
ResultSet rs = null;
int num=0;

String sql = "select count(id) from course0812";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

if(rs.next()){
	num = rs.getInt(1);
}
%>
<p>총 <%=num %>개의 교과목이 있습니다.</p><hr>
<table border="3" id="cou1">
<tr class="cour1">
<th >과목코드</th> <th>과목명</th> <th>학점</th> <th>담당강사</th>
<th>요일</th> <th>시작시간</th> <th>종료시간</th> <th>관리</th>
</tr>
<%
try{
	sql = "select * from course0812 order by id asc";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		String id = rs.getString(1);
		String name = rs.getString(2);
		String credit = rs.getString(3);
		String lect = rs.getString(4);
		if(lect.equals("1")){
			lect = "김교수";
		}else if(lect.equals("2")){
			lect = "이교수";
		}else if(lect.equals("3")){
			lect = "박교수";
		}else if(lect.equals("4")){
			lect = "우교수";
		}else if(lect.equals("5")){
			lect = "최교수";
		}else if(lect.equals("6")){
			lect = "강교수";
		}else if(lect.equals("7")){
			lect = "황교수";
		}
		String week = rs.getString(5);
		String start = rs.getString(6);
		String end = rs.getString(7);
		%>
		<tr>
		<td class="cour2"><%=id %></td>
		<td class="cour2"><%=name %></td>
		<td class="cour2"><%=credit %></td>
		<td class="cour2"><%=lect %></td>
		<td class="cour2"><%=week %></td>
		<td class="cour2"><%=start %></td>
		<td class="cour2"><%=end %></td>
		<td class="cour2">
		<a href="update_subject.jsp?id=<%=id %>">수정</a>
		/ <a href="delete_course.jsp?id=<%=id%>"onclick="if(!confirm("삭제하시겠습니까?"))return false;">삭제</a></td>
		</tr>
		<%
	}
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
<a href="course_insert.jsp"><button id="cou" class="btn">작성</button></a>
</table>
</section>
<footer><%@include file = "footer.jsp" %></footer>
</body>
</html>
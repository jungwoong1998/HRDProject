<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학사정보 조회</title>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<br/><h2>교과목 정보 조회</h2>
<%
PreparedStatement pstmt=null;
ResultSet rs = null;
int num=0;

String sql="select count(*) from course0923";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();

if(rs.next()){
	num=rs.getInt(1);
}
%>
<p>총 <%=num %>개의 교과목이 있습니다.</p><hr/>
<table border="3" id="tbn_select">
<tr>
<th>과목코드</th> <th>과목명</th> <th>학점</th> <th>담당강사</th> <th>요일</th> <th>시작시간</th> <th>종료시간</th> <th>관리</th>
</tr>
<%
pstmt=null;
rs=null;
try{
	sql="select * from course0923 order by id asc";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
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
		<td align="center"><%=id %></td>
		<td align="center"><%=name %></td>
		<td align="center"><%=credit %></td>
		<td align="center"><%=lecturer %></td>
		<td align="center"><%=week %></td>
		<td align="center"><%=start_hour %></td>
		<td align="center"><%=end_end %></td>
		<td align="center"><a href="update_course.jsp?id=<%=id%>">수정</a> / 
		 <a href="delete_course.jsp?id=<%=id%>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a> </td>
		</tr>
		<%
	}
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
</table>
<a href="insert_course.jsp"><button style="position: relative; top: 5%; left: 48%; background-color: gray; height: 30px; width: 100px; color: white;">작성</button></a>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
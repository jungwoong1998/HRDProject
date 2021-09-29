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
<br/><h2>교과목 목록</h2>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int num=0;

	String sql="select count(*) from course0923";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();

	if(rs.next()){
		num = rs.getInt(1);
	}
%>
<p style="padding-left: 19%;">총 <%=num %>개의 교과목이 있습니다.</p><hr/>
<table border="3" id="tbn_s2">
<tr class="tbn_1">
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
		if(week.equals("1")){
			week = "월요일";
		}else if(week.equals("2")){
			week = "화요일";
		}else if(week.equals("3")){
			week = "수요일";
		}else if(week.equals("4")){
			week = "목요일";
		}else if(week.equals("5")){
			week = "금요일";
		}else if(week.equals("6")){
			week = "토요일";
		}
		String start_hour = rs.getString(6);
		String end_end = rs.getString(7);
		%>
		<tr>
		<td class="tbn_stud"><%=id %></td> 
		<td class="tbn_stud"><%=name %></td> 
		<td class="tbn_stud"><%=credit %></td> 
		<td class="tbn_stud"><%=lecturer %></td> 
		<td class="tbn_stud"><%=week %></td> 
		<td class="tbn_stud"><%=start_hour %></td> 
		<td class="tbn_stud"><%=end_end %></td> 
		<td class="tbn_stud"><a href="courseUpdate.jsp?id=<%=id%>">수정</a>
		 / 
		 <a href="courseDelete.jsp?id=<%=id%>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false">삭제</a></td>
		<%
	}
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
</table>
<a href="courseInsert.jsp"><button id="btn1">작성</button></a>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
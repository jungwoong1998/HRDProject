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
<br/><h2>학사정보 목록</h2>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int num=0;

	String sql="select count(*) from stud0923";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();

	if(rs.next()){
		num = rs.getInt(1);
	}
%>
<p style="padding-left: 24%;">총 <%=num %>명의 학사정보가 있습니다.</p><hr/>
<table border="3" id="tbn_s1">
<tr class="tbn_1">
<th>학번</th> <th>성명</th> <th>학과</th> <th>학년</th> <th>주소</th> <th>연락처</th> <th>취미</th> <th>관리</th>
</tr>
<%
	pstmt=null;
	rs=null;
try{
	sql="select * from stud0923 order by studno asc";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	while(rs.next()){
		String studno = rs.getString(1);
		String name = rs.getString(2);
		String dept = rs.getString(3);
		if(dept.equals("1")){
			dept = "컴퓨터공학과";
		}else if(dept.equals("2")){
			dept = "기계공학과";
		}else if(dept.equals("3")){
			dept = "전자과";
		}else if(dept.equals("4")){
			dept = "영문학과";
		}else if(dept.equals("5")){
			dept = "일어과";
		}else if(dept.equals("6")){
			dept = "경영학과";
		}else if(dept.equals("7")){
			dept = "무역학과";
		}else if(dept.equals("8")){
			dept = "교육학과";
		}
		String position = rs.getString(4);
		String address = rs.getString(5);
		String phone = rs.getString(6);
		String hobby = rs.getString(7);
		%>
		<tr>
		<td class="tbn_stud"><%=studno %></td> 
		<td class="tbn_stud"><%=name %></td> 
		<td class="tbn_stud"><%=dept %></td> 
		<td class="tbn_stud"><%=position %></td> 
		<td class="tbn_stud"><%=address %></td> 
		<td class="tbn_stud"><%=phone %></td> 
		<td class="tbn_stud"><%=hobby %></td> 
		<td class="tbn_stud"><a href="studUpdate.jsp?studno=<%=studno%>">수정</a>
		 / 
		 <a href="studDelete.jsp?studno=<%=studno%>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false">삭제</a></td>
		<%
	}
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
</table>
<a href="studInsert.jsp"><button id="btn1">학사정보 추가</button></a>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
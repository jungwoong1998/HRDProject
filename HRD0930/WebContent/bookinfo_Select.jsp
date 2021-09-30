<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서정보 조회</title>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<br/><h1>학사정보 목록</h1>
<%
	PreparedStatement pstmt=null;
	ResultSet rs =null;
	int cnt=0;
	
	String sql = "select count(*) from bookinfo0930";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		cnt = rs.getInt(1);
	}
%>
<p>총 <%=cnt %>권의 도서정보가 있습니다.</p><hr/>
<table border="4" id="tbn2" >
<tr class="tbn2_tr">
<th>no</th> <th>도서코드</th> <th>저자</th> <th>도 서 명</th>
</tr>
<%
	pstmt=null;
	rs=null;
	int no=0;
	
	try{
		sql = "select * from bookinfo0930";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		while(rs.next()){
			String bookno = rs.getString(1);
			String author = rs.getString(2);
			String bookname = rs.getString(3);
			no++;
			%>
			<tr class="tbn2_td">
			<td><%=no %></td>
			<td><a href="bookinfo_Update.jsp?bookno<%=bookno %>"><%=bookno %></a></td>
			<td><%=author %></td>
			<td><%=bookname %></td>
			</tr>
			<%
		}
	}catch(SQLException e){
		e.printStackTrace();
		System.out.println("조회실패");
	}
%>
</table>
<a href="bookinfo_Insert.jsp"><button id="btn1">도서 정보 추가</button></a>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원정보 조회</title>
<style type="text/css">
#select_t{margin: 0 auto; width: 1200px; height: 250px;}
h1{text-align: center; font-family: 'HY견고딕';}
</style>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<br/>
<h1>사원 정보 조회</h1><hr/>
<table border="2" id="select_t">
<tr>
<th>no</th> <th>성명</th> <th>사번</th> <th>직급</th> <th>직책</th> <th>연락처</th> <th>소속부서</th> <th>주소</th>
</tr>
<%
PreparedStatement pstmt = null;
ResultSet rs = null;
int no=0;

try{
	String sql = "select * from info0902";
	pstmt = conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	while(rs.next()){
		String id = rs.getString(1);
		String name = rs.getString(2);
		String dept = rs.getString(3);
		if(dept.equals("10")){
			dept = "인사부";
		}else if(dept.equals("20")){
			dept = "기획부";
		}else if(dept.equals("30")){
			dept = "홍보부";
		}else if(dept.equals("40")){
			dept = "영업부";
		}else if(dept.equals("50")){
			dept = "경리부";
		}
		String position = rs.getString(4);
		if(position.equals("1")){
			position = "1급";
		}else if(position.equals("2")){
			position = "2급";
		}else if(position.equals("3")){
			position = "3급";
		}else if(position.equals("4")){
			position = "4급";
		}else if(position.equals("5")){
			position = "5급";
		}
		String duty = rs.getString(5);
		String phone = rs.getString(6);
		String address = rs.getString(7);
		no++;
		%>
		<tr>
		<td><%=no %></td>
		<td><%=name %></td>
		<td><a href="info_update.jsp?id=<%=id%>" style="color: blue;"><%=id %></a></td>
		<td><%=position %></td>
		<td><%=duty %></td>
		<td><%=phone %></td>
		<td><%=dept %></td>
		<td><%=address %></td>
		</tr>
		<%
	}
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
</table><hr/>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
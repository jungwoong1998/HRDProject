<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@include file="DBconn.jsp"%>
<%
PreparedStatement pstmt=null;
request.setCharacterEncoding("utf-8");

String idx = request.getParameter("idx");
String name = request.getParameter("name");
String major = request.getParameter("major");
String field = request.getParameter("field");

try{
	String sql = "insert into teacher0915 values(?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, idx);
	pstmt.setString(2, name);
	pstmt.setString(3, major);
	pstmt.setString(4, field);
	pstmt.executeUpdate();
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록실패");
}
%>
<script>
alert("완료되었습니다.");
history.back();
</script>
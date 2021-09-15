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
	String sql = "update teacher0915 set name=?,major=?,field=? where idx=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, major);
	pstmt.setString(3, field);
	pstmt.setString(4, idx);
	pstmt.executeUpdate();
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("수정실패");
}
%>
<script>
alert("완료되었습니다.");
history.back();
</script>
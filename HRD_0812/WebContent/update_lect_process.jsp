<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import ="java.sql.*"%>
<%@include file="dbconn.jsp"%>
<%
PreparedStatement pstmt = null;
request.setCharacterEncoding("utf-8");

String idx = request.getParameter("idx");
String name = request.getParameter("name");
String major = request.getParameter("major");
String field = request.getParameter("field");

try{
	String sql = "update lecturer0812 set name=?,major=?,field=? where idx=?";
	pstmt = conn.prepareStatement(sql);
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file = "dbconn.jsp"%>
<%
PreparedStatement pstmt = null;

String id = request.getParameter("id");

try{
	String sql = "delete from product0802 where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.executeUpdate();
	System.out.println("삭제성공");
}catch(SQLException e){
	System.out.println("삭제실패");
	e.printStackTrace();
}
%>
<script>
history.back();
</script>
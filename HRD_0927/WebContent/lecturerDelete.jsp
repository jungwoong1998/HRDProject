<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="DBconn.jsp" %>
<%
PreparedStatement pstmt=null;
request.setCharacterEncoding("utf-8");

String idx = request.getParameter("idx");

try{
	String sql = "delete from lecturer0923 where idx=? ";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, idx);
	pstmt.executeUpdate();
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("삭제실패");
}
%>
<script>
alert("완료되었습니다.");
history.back();
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="DBconn.jsp" %>
<%
PreparedStatement pstmt=null;
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String name = request.getParameter("name");
String credit = request.getParameter("credit");
String lecturer = request.getParameter("lecturer");
String week = request.getParameter("week");
String start_hour = request.getParameter("start_hour");
String end_end= request.getParameter("end_end");

try{
	String sql = "update course0923 set name=?,credit=?,lecturer=?,week=?,start_hour=?,end_end=? where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, credit);
	pstmt.setString(3, lecturer);
	pstmt.setString(4, week);
	pstmt.setString(5, start_hour);
	pstmt.setString(6, end_end);
	pstmt.setString(7, id);
	pstmt.executeUpdate();
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("수정실패");
}
%>
<script>
alert("수정완료");
history.back();
</script>

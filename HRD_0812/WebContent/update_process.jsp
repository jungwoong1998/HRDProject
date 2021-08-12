<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import ="java.sql.*"%>
<%@include file="dbconn.jsp"%>
<%
PreparedStatement pstmt = null;
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String name = request.getParameter("name");
String cred = request.getParameter("credit");
String lect = request.getParameter("lect");
String week = request.getParameter("week");
String start = request.getParameter("start");
String end = request.getParameter("end");
try{
	String sql = "update course0812 set name=?,credit=?,lecturer=?,week=?,start_hour=?,end_end=? where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, cred);
	pstmt.setString(3, lect);
	pstmt.setString(4, week);
	pstmt.setString(5, start);
	pstmt.setString(6, end);
	pstmt.setString(7, id);
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
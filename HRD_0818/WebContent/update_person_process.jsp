<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="DBconn.jsp"%>
<%
PreparedStatement pstmt=null;
request.setCharacterEncoding("utf-8");

String id=request.getParameter("id");
String name=request.getParameter("name");
String dept=request.getParameter("dept");
String position=request.getParameter("position");
String duty=request.getParameter("duty");
String phone=request.getParameter("phone");

try{
	String sql="update person0818 set name=?,dept=?,position=?,duty=?,phone=? where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, dept);
	pstmt.setString(3, position);
	pstmt.setString(4, duty);
	pstmt.setString(5, phone);
	pstmt.setString(6, id);
	pstmt.executeUpdate();
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("입력실패");
}
%>
<script>
alert("등록되었습니다.");
history.back();
</script>
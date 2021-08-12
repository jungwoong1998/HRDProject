<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import ="java.sql.*"%>
<%@include file="dbconn.jsp"%>
<%
PreparedStatement pstmt = null;
request.setCharacterEncoding("utf-8");

String stud = request.getParameter("stud");
String name = request.getParameter("name");
String dept = request.getParameter("dept");
String posi = request.getParameter("posi");
String addr = request.getParameter("addr");
String phone = request.getParameter("phone");
try{
	String sql = "insert into stud0812 values(?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, stud);
	pstmt.setString(2, name);
	pstmt.setString(3, dept);
	pstmt.setString(4, posi);
	pstmt.setString(5, addr);
	pstmt.setString(6, phone);
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
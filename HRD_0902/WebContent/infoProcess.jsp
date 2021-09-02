<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="DBconn.jsp" %>
<%
PreparedStatement pstmt=null;
request.setCharacterEncoding("utf-8");

String id =request.getParameter("id");
String name = request.getParameter("name");
String dept = request.getParameter("dept");
String position = request.getParameter("position");
String duty = request.getParameter("duty");
String phone = request.getParameter("phone");
String address = request.getParameter("address");

try{
	String sql = "insert into info0902 values(?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setString(3, dept);
	pstmt.setString(4, position);
	pstmt.setString(5, duty);
	pstmt.setString(6, phone);
	pstmt.setString(7, address);
	pstmt.executeUpdate();
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록실패");
}
%>
<script>
alert("등록완료");
history.back();
</script>
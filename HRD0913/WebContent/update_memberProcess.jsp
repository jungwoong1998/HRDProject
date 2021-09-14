<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@include file="DBconn.jsp"%>
<%
PreparedStatement pstmt = null;
request.setCharacterEncoding("utf-8");

String custno = request.getParameter("custno");
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String joindate = request.getParameter("joindate");
String  grade = request.getParameter("grade");
String city = request.getParameter("city");

try{
	String sql = "update member0913 set custname=?, phone=?, address=?, joindate=?, grade=?, city=? where custno=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, custname);
	pstmt.setString(2, phone);
	pstmt.setString(3, address);
	pstmt.setString(4, joindate);
	pstmt.setString(5, grade);
	pstmt.setString(6, city);
	pstmt.setString(7, custno);
	pstmt.executeUpdate();
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("수정실패");
}
%>
<script>
alert("회원정보수정이 완료되었습니다!");
history.back();
</script>
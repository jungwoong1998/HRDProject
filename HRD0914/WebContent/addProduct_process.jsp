<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@include file="DBconn.jsp"%>
<%
PreparedStatement pstmt=null;
request.setCharacterEncoding("utf-8");

String productid = request.getParameter("productid");
String name = request.getParameter("name");
String unitprice = request.getParameter("unitprice");
String description =request.getParameter("description");
String categoey = request.getParameter("categoey");
String  manufacturer = request.getParameter(" manufacturer");
String unitsInstock = request.getParameter("unitsInstock");
String condition = request.getParameter("condition");

try{
	String sql = "insert into product0914 values(?,?,?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, productid);
	pstmt.setString(2, name);
	pstmt.setString(3, unitprice);
	pstmt.setString(4, description);
	pstmt.setString(5, categoey);
	pstmt.setString(6, manufacturer);
	pstmt.setString(7, unitsInstock);
	pstmt.setString(8, condition);
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록실패");
}
%>
<script>
alert("등록성공");
history.back();
</script>
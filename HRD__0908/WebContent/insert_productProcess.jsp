<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="DBconn.jsp"%>
<%
PreparedStatement pstmt = null;
request.setCharacterEncoding("utf-8");

String productId = request.getParameter("productId");
String productName = request.getParameter("productName");
String unitprice = request.getParameter("unitprice");
String description = request.getParameter("description");
String category = request.getParameter("category");
String manufacturer = request.getParameter("manufacturer");
String unitsInstock = request.getParameter("unitsInstock");
String condition = request.getParameter("condition");

try{
	String sql = "insert into product0908 values(?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	pstmt.setString(2, productName);
	pstmt.setString(3, unitprice);
	pstmt.setString(4, description);
	pstmt.setString(5, category);
	pstmt.setString(6, manufacturer);
	pstmt.setString(7, unitsInstock);
	pstmt.setString(8, condition);
	pstmt.executeUpdate();
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록실패");
}
%>
<script>
alert("등록완료");
histroy.back();
</script>
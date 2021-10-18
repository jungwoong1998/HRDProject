<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="DBconn.jsp"%>
<%
PreparedStatement pstmt = null;
request.setCharacterEncoding("utf-8");

String PRODUCTID = request.getParameter("PRODUCTID");
String PRODUCTNAME = request.getParameter("PRODUCTNAME");
String UNITPRICE = request.getParameter("UNITPRICE");
String DESCRIPTION = request.getParameter("DESCRIPTION");
String CATEGORY = request.getParameter("CATEGORY");
String MANUFACTURER = request.getParameter("MANUFACTURER");
String UNITSINSTOCK = request.getParameter("UNITSINSTOCK");
String CONDITION = request.getParameter("CONDITION");

try{
	String sql = "insert into product1011 values(?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, PRODUCTID);
	pstmt.setString(2, PRODUCTNAME);
	pstmt.setString(3, UNITPRICE);
	pstmt.setString(4, DESCRIPTION);
	pstmt.setString(5, CATEGORY);
	pstmt.setString(6, MANUFACTURER);
	pstmt.setString(7, UNITSINSTOCK);
	pstmt.setString(8, CONDITION);
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
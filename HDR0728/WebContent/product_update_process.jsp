<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@include file = "dbconn.jsp"%>
<%
PreparedStatement pstmt = null;
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String category = request.getParameter("category");
String wname = request.getParameter("wname");
String pname = request.getParameter("pname");
String sname = request.getParameter("sname");
String price = request.getParameter("price");
String downprice = request.getParameter("downprice");
String inputdate = request.getParameter("inputdate");
String stock = request.getParameter("stock");
String description = request.getParameter("description");

System.out.println(id+category+wname+pname+sname+price+downprice+inputdate+stock+description);
try{
	String sql = "update product0802 set category=?,wname=?,pname=?,sname=?,price=?,downprice=?,inputdate=?,stock=?,description=? where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, category);
	pstmt.setString(2, wname);
	pstmt.setString(3, pname);
	pstmt.setString(4, sname);
	pstmt.setString(5, price);
	pstmt.setString(6, downprice);
	pstmt.setString(7, inputdate);
	pstmt.setString(8, stock);
	pstmt.setString(9, description);
	pstmt.setString(10, id);
	pstmt.executeUpdate();
	
	System.out.println("수정성공");
}catch(SQLException e){
	System.out.println("수정실패");
	e.printStackTrace();
}
%>
<script>
history.back();
</script>
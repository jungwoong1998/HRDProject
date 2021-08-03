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
	String sql = "insert into product0802(id,category,wname,pname,sname,price,downprice,inputdate,stock,description) values(?,?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, category);
	pstmt.setString(3, wname);
	pstmt.setString(4, pname);
	pstmt.setString(5, sname);
	pstmt.setString(6, price);
	pstmt.setString(7, downprice);
	pstmt.setString(8, inputdate);
	pstmt.setString(9, stock);
	pstmt.setString(10, description);
	pstmt.executeUpdate();
	
	System.out.println("등록성공");
}catch(SQLException e){
	System.out.println("등록실패");
	e.printStackTrace();
}
%>
<script>
history.back();
</script>
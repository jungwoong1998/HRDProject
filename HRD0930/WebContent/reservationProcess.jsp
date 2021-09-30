<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@include file="DBconn.jsp"%>
<%System.out.println("등록aaa");
PreparedStatement pstmt=null;
request.setCharacterEncoding("utf-8");

String lentno = request.getParameter("lentno");
String custname = request.getParameter("custname");
String bookno = request.getParameter("bookno");
String bookname = request.getParameter("bookname");
String outdate = request.getParameter("outdate");
String indate = request.getParameter("indate");
String status = request.getParameter("status");
String Class = request.getParameter("class");

try{
	String sql = "insert into reservation0930 values(?,?,?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, lentno);
	pstmt.setString(2, custname);
	pstmt.setString(3, bookno);
	pstmt.setString(4, bookname);
	pstmt.setString(5, outdate);
	pstmt.setString(6, indate);
	pstmt.setString(7, status);
	pstmt.setString(8, Class);
	pstmt.executeUpdate();
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록실패");
}
%>
<script>
alert("저장되었습니다.");
history.back();
</script>
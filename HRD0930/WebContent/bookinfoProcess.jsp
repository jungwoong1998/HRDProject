<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="DBconn.jsp"%>
<%
	PreparedStatement pstmt=null;
	request.setCharacterEncoding("utf-8");

	String bookno = request.getParameter("bookno");
	String author = request.getParameter("author");
	String bookname = request.getParameter("bookname");
	
	try{
		String sql = "insert into bookinfo0930 values(?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bookno);
		pstmt.setString(2, author);
		pstmt.setString(3, bookname);
		pstmt.executeUpdate();
	}catch(SQLException e){
		e.printStackTrace();
		System.out.println("등록실패");
	}
%>
<script>
	alert("등록이 완료되었습니다!");
	history.back();
</script>
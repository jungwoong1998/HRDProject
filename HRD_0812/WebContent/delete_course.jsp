<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import = "java.sql.*"%>
 <%@include file = "dbconn.jsp"%>
 <%
 PreparedStatement pstmt = null;

 String id = request.getParameter("id");
 try{
	 String sql = "delete from course0812 where id=?";
	 pstmt=conn.prepareStatement(sql);
	 pstmt.setString(1, id);
	 pstmt.executeUpdate();
	 
 }catch(SQLException e){
	 e.printStackTrace();
	 System.out.println("삭제실패");
 }
 %>
 <script>
 alert("완료되었습니다.");
 history.back();
 </script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@include file="DBconn.jsp"%>
<%
PreparedStatement pstmt=null;


String id=request.getParameter("id");
String name=request.getParameter("name");

try{
	String sql="delete from person0818 where id=? and name=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.executeUpdate();
	
}catch(SQLException e){
	e.printStackTrace();
}
%>
<script>
alert("삭제완료");
history.back();
</script>
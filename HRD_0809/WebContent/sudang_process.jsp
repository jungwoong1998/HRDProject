<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<%@include file = "dbconn.jsp"%>
<%
PreparedStatement pstmt = null;
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String gajok = request.getParameter("gajok");
String jikchak = request.getParameter("jikchak");
String gunsok = request.getParameter("gunsok");
String gitasudang = request.getParameter("gitasudang");

try{
	String sql = "insert into sudnag0809 values(?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, gajok);
	pstmt.setString(3, jikchak);
	pstmt.setString(4, gunsok);
	pstmt.setString(5, gitasudang);
	pstmt.executeUpdate();
	
}catch(SQLException e){
	e.printStackTrace();
}
%>
<script>
history.back();
</script>
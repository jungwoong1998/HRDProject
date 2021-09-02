<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="DBconn.jsp" %>
<%
PreparedStatement pstmt=null;
request.setCharacterEncoding("utf-8");

String dunggub =request.getParameter("dunggub");
String salary = request.getParameter("salary");


try{
	String sql = "update hobong0902 set salary=? where dunggub=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, salary);
	pstmt.setString(2, dunggub);
	pstmt.executeUpdate();
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("변경실패");
}
%>
<script>
alert("변경완료");
history.back();
</script>
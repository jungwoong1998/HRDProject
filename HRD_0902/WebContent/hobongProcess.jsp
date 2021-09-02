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
	String sql = "insert into hobong0902 values(?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, dunggub);
	pstmt.setString(2, salary);
	pstmt.executeUpdate();
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록실패");
}
%>
<script>
alert("등록완료");
history.back();
</script>
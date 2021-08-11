<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file = "dbconn.jsp" %>
<%
PreparedStatement pstmt = null;
request.setCharacterEncoding("utf-8");

String dunggub = request.getParameter("dunggub");
String salary = request.getParameter("salary");

try{
	String sql = "insert into hobong0809 values(?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, dunggub);
	pstmt.setString(2, salary);
	pstmt.executeUpdate();
	
}catch(SQLException e){
	e.printStackTrace();
}
%>
<script>
history.back();
</script>

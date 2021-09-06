<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="DBconn.jsp" %>
<%
PreparedStatement pstmt=null;
request.setCharacterEncoding("utf-8");

String id =request.getParameter("id");
String gajok = request.getParameter("gajok");
String jikchak = request.getParameter("jikchak");
String gunsok = request.getParameter("gunsok");
String gitasudang = request.getParameter("gitasudang");

try{
	String sql = "insert into sudang0902 values(?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, gajok);
	pstmt.setString(3, jikchak);
	pstmt.setString(4, gunsok);
	pstmt.setString(5, gitasudang);
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
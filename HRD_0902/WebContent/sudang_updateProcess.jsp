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
	String sql = "update sudang0902 set gajok=?, jikchak=?, gunsok=?, gitasudang=? where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, gajok);
	pstmt.setString(2, jikchak);
	pstmt.setString(3, gunsok);
	pstmt.setString(4, gitasudang);
	pstmt.setString(5, id);
	pstmt.executeUpdate();
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("수정실패");
}
%>
<script>
alert("수정완료");
history.back();
</script>
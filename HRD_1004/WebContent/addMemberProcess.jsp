<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="DBconn.jsp"%>
<%
PreparedStatement pstmt=null;
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String name = request.getParameter("name");
String password = request.getParameter("password");
String gender = request.getParameter("gender");
String birth = request.getParameter("birth1")+request.getParameter("birth2")+request.getParameter("birth3");
String mail = request.getParameter("mail1")+"@"+request.getParameter("mail2");
String phone = request.getParameter("phone");
String address = request.getParameter("address");

try{
	String sql = "insert into member1004 values(?,?,?,?,?,?,?,?,sysdate)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	pstmt.setString(3, name);
	pstmt.setString(4, gender);
	pstmt.setString(5, birth);
	pstmt.setString(6, mail);
	pstmt.setString(7, phone);
	pstmt.setString(8, address);
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
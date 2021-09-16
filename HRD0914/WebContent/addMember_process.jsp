<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@include file="DBconn.jsp"%>
<%
PreparedStatement pstmt=null;
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String password = request.getParameter("password");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
System.out.println(request.getParameter("mail2"));
String birth =request.getParameter("birth1")+request.getParameter("birth2")+request.getParameter("birth3");
String mail = request.getParameter("mail1")+"@"+request.getParameter("mail2");
String phone = request.getParameter("phone");
String address = request.getParameter("address");

System.out.println(id+"\n"+password+"\n"+name+"\n"+gender+"\n"+birth+"\n"+mail+"\n"+phone+"\n"+address);

try{
	String sql = "insert into member0914 values(?,?,?,?,?,?,?,?,sysdate)";
	pstmt=conn.prepareStatement(sql);
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
alert("등록성공");
history.back();
</script>
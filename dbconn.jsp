<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import  = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
Connection conn = null;
request.setCharacterEncoding("utf-8");

try{
	String url = "jdbc:oracle:thin:@//localhost:1521/xe";
	String user = "system";
	String pass = "1234";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	System.out.println("연결성공");
	
}catch(SQLException e){
	System.out.println("연결실패");
	e.printStackTrace();
}
%>
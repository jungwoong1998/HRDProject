<%@page import="org.apache.tomcat.dbcp.dbcp2.SQLExceptionList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%
Connection conn = null;
request.setCharacterEncoding("utf-8");

try{
	String url = "jdbc:oracle:thin:@//localhost:1521/xe";
	String user = "system";
	String pass = "1234";
	
	Class.forName("oracle.jdbc.OracleDriver");
	
	conn = DriverManager.getConnection(url, user, pass);
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("db연결 실패");
}
%>
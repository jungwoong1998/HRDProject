<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	Connection conn = null;
	
try{
	String url = "jdbc:oracle:thin:@//localhost:1521/xe";
	String user = "system";
	String pw = "1234";
	
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, user, pw);
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("DB연결실패");
}
%>
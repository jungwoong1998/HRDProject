<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="DBconn.jsp" %>
<%
PreparedStatement pstmt=null;
request.setCharacterEncoding("utf-8");

String studno = request.getParameter("studno");
String name = request.getParameter("name");
String dept = request.getParameter("dept");
String position = request.getParameter("position");
String address = request.getParameter("address");
String phone = request.getParameter("phone");
String[] hob= request.getParameterValues("hobby");
String hobby="";
if(hob != null){
	for(int i=0;i<hob.length;i++){
		if(i==(hob.length-1)){
			hobby += hob[i];
		}else{
			hobby += hob[i]+",";
		}
	}
}

try{
	String sql = "insert into stud0923(studno,name,dept,position,address,phone,hobby) values(?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, studno);
	pstmt.setString(2, name);
	pstmt.setString(3, dept);
	pstmt.setString(4, position);
	pstmt.setString(5, address);
	pstmt.setString(6, phone);
	pstmt.setString(7, hobby);
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

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
	String sql = "update stud0923 set name=?,dept=?,position=?,address=?,phone=?,hobby=? where studno=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, dept);
	pstmt.setString(3, position);
	pstmt.setString(4, address);
	pstmt.setString(5, phone);
	pstmt.setString(6, hobby);
	pstmt.setString(7, studno);
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

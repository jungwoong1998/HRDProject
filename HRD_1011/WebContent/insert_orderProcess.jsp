<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="DBconn.jsp"%>
<%
PreparedStatement pstmt = null;
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String name = request.getParameter("name");
String ORDERDATE = request.getParameter("ORDERDATE");
String TEL = request.getParameter("TEL");
String ADDR = request.getParameter("ADDR");
String pay = request.getParameter("pay");
String CARDNO = request.getParameter("CARDNO");
String PRODCOUNT = request.getParameter("PRODCOUNT");
String total = request.getParameter("total");

try{
	String sql = "insert into order1011 values(?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setString(3, ORDERDATE);
	pstmt.setString(4, TEL);
	pstmt.setString(5, ADDR);
	pstmt.setString(6, pay);
	pstmt.setString(7, CARDNO);
	pstmt.setString(8, PRODCOUNT);
	pstmt.setString(9, total);
	pstmt.executeUpdate();
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록실패");
}
%>
<script>
alert("완료되었습니다.");
history.back();
</script>
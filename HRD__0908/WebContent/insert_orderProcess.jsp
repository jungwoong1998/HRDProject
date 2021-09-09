<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="DBconn.jsp"%>
<%
PreparedStatement pstmt = null;
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String name = request.getParameter("name");
String orderdate = request.getParameter("orderdate");
String addr = request.getParameter("addr");
String tel = request.getParameter("tel");
String pay = request.getParameter("pay");
String cardno = request.getParameter("cardno");
String prodcount = request.getParameter("prodcount");
String total = request.getParameter("total");

try{
	String sql = "insert into order0908 values(?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setString(3, orderdate);
	pstmt.setString(4, addr);
	pstmt.setString(5, tel);
	pstmt.setString(6, pay);
	pstmt.setString(7, cardno);
	pstmt.setString(8, prodcount);
	pstmt.setString(9, total);
	pstmt.executeUpdate();
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록실패");
}
%>
<script>
alert("등록완료");
histroy.back();
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@include file = "dbconn.jsp"%>
<%
PreparedStatement pstmt = null;
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String name = request.getParameter("name");
String orderdate = request.getParameter("orderdate");
String tel = request.getParameter("tel");
String addr = request.getParameter("addr");
String pay = request.getParameter("pay");
String cardno = request.getParameter("cardno");
String prodcount = request.getParameter("prodcount");
String total = request.getParameter("total");

if(name==null||name.equals("null")){
	name="";
}if(orderdate==null||name.equals("null")){
	name="";
}if(addr==null||addr.equals("null")){
	addr="";
}if(pay==null||pay.equals("null")){
	pay="";
}if(tel==null||tel.equals("null")){
	tel="";
}if(cardno==null||cardno.equals("null")){
	cardno="";
}
try{
	String sql = "update order0802 set name=?,orderdate=?,tel=?,addr=?,pay=?,cardno=?,prodcount=?,total=? where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, orderdate);
	pstmt.setString(3, tel);
	pstmt.setString(4, addr);
	pstmt.setString(5, pay);
	pstmt.setString(6, cardno);
	pstmt.setString(7, prodcount);
	pstmt.setString(8, total);
	pstmt.setString(9, id);
	pstmt.executeUpdate();
	
	System.out.println("수정성공");
}catch(SQLException e){
	System.out.println("수정실패");
	e.printStackTrace();
}
%>
<script>
history.back();
</script>
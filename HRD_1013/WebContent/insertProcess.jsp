<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="DBconn.jsp"%>
<%
PreparedStatement pstmt = null;

String sNo = request.getParameter("sNo");
String sName = request.getParameter("sName");
String kor = request.getParameter("kor");
String eng = request.getParameter("eng");
String math = request.getParameter("math");
String hist = request.getParameter("hist");

try{
	String sql = "insert into score1013 values(?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, sNo);
	pstmt.setString(2, sName);
	pstmt.setString(3, kor);
	pstmt.setString(4, eng);
	pstmt.setString(5, math);
	pstmt.setString(6, hist);
	pstmt.executeUpdate();
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록실패");
}
%>
<script>
alert("성적입력이 완료 되었습니다!");
history.back();
</script>
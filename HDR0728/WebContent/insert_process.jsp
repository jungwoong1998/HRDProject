<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file = "dbconn.jsp" %>
<%
PreparedStatement pstmt = null;
request.setCharacterEncoding("utf-8");

String sNo = request.getParameter("sNo");
String sName = request.getParameter("sName");
String kor = request.getParameter("kor");
String eng = request.getParameter("eng");
String math = request.getParameter("math");
String hist = request.getParameter("hist");

System.out.println(sNo+"\n"+sName+"\n"+kor+"\n"+eng+"\n"+math+"\n"+hist);

try{
	String sql = "insert into score0728(sNo,sName,kor,eng,math,hist) values(?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, sNo);
	pstmt.setString(2, sName);
	pstmt.setString(3, kor);
	pstmt.setString(4, eng);
	pstmt.setString(5, math);
	pstmt.setString(6, hist);
	pstmt.executeUpdate();
	
	System.out.println("등록성공");
	
}catch(SQLException e){
	System.out.println("등록실패");
	e.printStackTrace();
}
%>
<script>
alert("성적입력이 완료 되었습니다.");
history.back();
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 예약 정보 조회</title>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<br/><h1>도서 대출 예약 정보 등록 화면</h1>
<%@include file="DBconn.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs =null;
	int cnt=0;
	
	String sql = "select count(*) from reservation0930";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		cnt = rs.getInt(1);
	}
%>
<p style="padding-left: 19%;">총 <%=cnt %>권의 도서 예약 정보가 있습니다.</p><hr/>
<table border="3" id="tbn4">
<tr>
<th>no</th> <th>대출번호</th> <th>고객성명</th> <th>도서코드</th> <th>도서명</th> <th>대출일자</th> <th>반납일자</th> <th>대출상태</th>
<th>등급</th>
</tr>
<%
pstmt=null;
rs=null;
int no=0;

try{
	sql = "select a.lentno,a.custname,a.bookno,b.bookname,to_char(a.outdate,'yyyy-mm-dd'),to_char(a.indate,'yyyy-mm-dd'),a.status,a.class from reservation0930 a,bookinfo0930 b where a.bookno=b.bookno";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	while(rs.next()){
		String lentno = rs.getString(1);
		String custname = rs.getString(2);
		String bookno = rs.getString(3);
		String bookname = rs.getString(4);
		String outdate = rs.getString(5);
		String indate = rs.getString(6);
		String status = rs.getString(7);
		String Class = rs.getString(8);
		no++;
		%>
		<tr class="tbn4_col">
		<td><%=no %></td>
		<td><a href="reservation_Update.jsp?lentno<%=lentno%>"><%=lentno %></a></td>
		<td><%=custname %></td>
		<td><%=bookno %></td>
		<td><%=bookname %></td>
		<td><%=outdate %></td>
		<td><%=indate %></td>
		<td><%=status %></td>
		<td><%=Class %></td>
		</tr>
		<%
	}
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}
%>
</table>
<a href="bookinfo_Insert.jsp"><button id="btn1">도서 정보 추가</button></a>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
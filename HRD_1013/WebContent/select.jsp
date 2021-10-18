<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성적조회</title>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<h1 style="line-height: 60px; text-align: center;">성적조회목록</h1><br/>
<hr/><table border="1" id="t1">
<tr>
<th>학년</th> <th>반</th> <th>번호</th> <th>성명</th> <th>국어</th> <th>영어</th> <th>수학</th> <th>역사</th> <th>총점</th> <th>평균</th>
</tr>
<%
PreparedStatement pstmt = null;
ResultSet rs = null;
int sum=0;
double avg=0;

try{
	String sql = "select * from score1013 order by sNo asc";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		String sNo1 = rs.getString(1);
		sNo1.substring(0);
		String sNo2 = rs.getString(1);
		sNo2.substring(0);
		String sNo3 = rs.getString(1);
		sNo3.substring(0);
		String sName = rs.getString(2);
		String kor = rs.getString(3);
		String eng = rs.getString(4);
		String math = rs.getString(5);
		String hish = rs.getString(6);
		sum = rs.getInt(3)+rs.getInt(4)+rs.getInt(5)+rs.getInt(6);
		avg = ((rs.getDouble(3)+rs.getDouble(4)+rs.getDouble(5)+rs.getDouble(6))/4.00);
		
		%>
		<tr>
		<td class="in1"><%=sNo1.substring(0,1) %></td>
		<td class="in1"><%=sNo2.substring(1,3) %></td>
		<td class="in1"><%=sNo3.substring(3,5) %></td>
		<td class="in1"><%=sName %></td>
		<td class="in1"><%=kor %></td>
		<td class="in1"><%=eng %></td>
		<td class="in1"><%=math %></td>
		<td class="in1"><%=hish %></td>
		<td class="in1"><%=sum %></td>
		<td class="in1"><%=avg %></td>
		</tr>
		<%
	}
	
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("조회실패");
}

pstmt = null;
rs = null;
int kor1=0,eng1=0,math1=0,hist1=0,sum1=0;
double avg1=0;
try{
String sql = "select * from score1013";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

while(rs.next()){
	kor1 += rs.getInt(3);
	eng1 += rs.getInt(4);
	math1 += rs.getInt(5);
	hist1 += rs.getInt(6);
	sum1 += rs.getInt(3)+rs.getInt(4)+rs.getInt(5)+rs.getInt(6);
	avg1 += ((rs.getDouble(3)+rs.getDouble(4)+rs.getDouble(5)+rs.getDouble(6))/4.00);
}
%>
<tr>
<th></th> <th></th> <th></th> <th>총점</th>
<td class="in1"><%=kor1 %></td> <td class="in1"><%=eng1 %></td> <td class="in1"><%=math1 %></td> <td class="in1"><%=hist1 %></td> <td class="in1"><%=sum1 %></td> <td class="in1"><%=avg1 %></td>
</tr>
<%
}catch(SQLException e){
	e.printStackTrace();
}

pstmt = null;
rs = null;
int co=0;
double koav=0,enav=0,mav=0,hiav=0,sumav=0,allav=0;
String sql = "select count(*) from score1013";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

while(rs.next()){
	co = rs.getInt(1);
}
koav = kor1/co;
enav = eng1/co;
mav = math1/co;
hiav = hist1/co;
sumav = koav+enav+mav+hiav;
allav = sumav/4.00;
%>
<tr>
<th></th><th></th><th></th><th>총평균</th>
<td class="in1"><%=koav %></td> <td class="in1"><%=enav %></td> <td class="in1"><%=mav %></td> <td class="in1"><%=hiav %></td> <td class="in1"><%=sumav %></td> <td class="in1"><%=allav %></td>
</tr>
</table>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
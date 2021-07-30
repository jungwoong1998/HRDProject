<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성적조회</title>
<style>
#t{
margin: 0 auto;
width: 600px;
}
.t{
text-align: center;
}
</style>
</head>
<body>
<header><%@include file = "header.jsp" %></header>
<nav><%@include file = "nav.jsp" %></nav>
<section>
<%@include file ="dbconn.jsp" %>
<h2>성적조회목록</h2><hr>
<table border="1" id="t">
<tr>
<th>학년</th> <th>반</th> <th>번호</th>
<th>성명</th> <th>국어</th> <th>영어</th> <th>수학</th> <th>역사</th>
<th>총점</th> <th>평균</th>
</tr>
<%
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	String sql = "select * from score0728 order by sNo asc";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	int sum=0;
	double avg = 0;
	
	while(rs.next()){
		String sNo1 = rs.getString("sNo");
		sNo1.substring(0);
		String sNo2 = rs.getString("sNo");
		sNo2.substring(0);
		String sNo3 = rs.getString("sNo");
		sNo3.substring(0);
		String sName = rs.getString("sName");
		String kor = rs.getString("kor");
		String eng = rs.getString("eng");
		String math = rs.getString("math");
		String hist = rs.getString("hist");
		sum = rs.getInt(3)+rs.getInt(4)+rs.getInt(5)+rs.getInt(6);
		avg = (rs.getDouble(3)+rs.getDouble(4)+rs.getDouble(5)+rs.getDouble(6))/4;
	%>
	<tr>
	<td class="t"><%=sNo1.substring(0, 1) %></td>
	<td class="t"><%=sNo2.substring(1,3) %></td>
	<td class="t"><%=sNo2.substring(3) %></td>
	<td class="t"><%=sName %></td>
	<td class="t"><%=kor %></td>
	<td class="t"><%=eng %></td>
	<td class="t"><%=math %></td>
	<td class="t"><%=hist %></td>
	<td class="t"><%=sum %></td>
	<td class="t"><%=avg %></td>
	</tr>
	<%	
	}
	System.out.println("조회성공");
}catch(SQLException e){
	System.out.println("조회실패");
	e.printStackTrace();
}
%>
<% 
pstmt = null;
rs = null;
String sql = "select * from score0728 order by sNo asc";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

int korcount=0,engcount=0,mathcount=0,histcount=0;
int korsum=0,engsum=0,mathsum=0,histsum=0,allsum=0;
double allavg1=0.0,allavg2=0.0,koravg=0.0,engavg=0.0,mathavg=0.0,histavg=0.0,sumavgs=0.0;

while(rs.next()){
	korsum += rs.getInt(3);
	engsum += rs.getInt("eng");
	mathsum += rs.getInt("math");
	histsum += rs.getInt("hist");
	allsum = korsum+engsum+mathsum+histsum;
	allavg1 = ((rs.getDouble(3)+korsum)+(rs.getDouble(4)+engsum)+(rs.getDouble(5)+mathsum)+(rs.getDouble(6)+histsum))/4;
	korcount++;
	engcount++;
	mathcount++;
	histcount++;

}
	koravg = korsum/korcount;
	engavg = engsum/engcount;
	mathavg = mathsum/mathcount;
	histavg = histsum/histcount;
	sumavgs = (koravg+engavg+mathavg+histavg);
	allavg2 = (koravg+engavg+mathavg+histavg)/4;
	
%>
<tr>
	<td></td>
	<td></td>
	<td></td>
	<td class="t">총점</td>
	<td class="t"><%=korsum %></td>
	<td class="t"><%=engsum %></td>
	<td class="t"><%=mathsum %></td>
	<td class="t"><%=histsum %></td>
	<td class="t"><%=allsum %></td>
	<td class="t"><%=allavg1 %></td>
	</tr>
<tr>
	<td></td>
	<td></td>
	<td></td>
	<td class="t">평균</td>
	<td class="t"><%=koravg %></td>
	<td class="t"><%=engavg %></td>
	<td class="t"><%=mathavg %></td>
	<td class="t"><%=histavg %></td>
	<td class="t"><%=sumavgs %></td>
	<td class="t"><%=allavg2 %></td>
	</tr>
</table><hr>
</section>
<footer><%@include file = "footer.jsp" %></footer>
</body>
</html>
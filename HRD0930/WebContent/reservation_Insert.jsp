<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 대출 예약 정보 등록</title>
<script type="text/javascript">
function check(str) {alert("aaaa."+str);
	if(document.reservation.lentno.value==""){
		alert("대출번호가 입력되지 않았습니다.");
		docuemnt.reservation.lentno.focus();
	}else if(document.reservation.custname.value==""){
		alert("고객성명이 입력되지 않았습니다.");
		document.reservation.custname.focus();
	}else if(document.reservation.bookno.value==""){
		alert("도서코드가 입력되지 않았습니다.");
		document.reservation.bookno.focus();
	}else if(document.reservation.outdate.value==""){
		alert("대출일자가 입력되지 않았습니다.");
		document.reservation.outdate.focus();
	}else if(str=="insert"){alert("aaaa.aaa");
		form.action="reservationProcess.jsp";
	}
}
function booknames() {
	document.reservation.submit();
}
</script>
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
	/*onchange로 인해 폼의 입력값 초기화방지를 위해 기입 */
	String bookno = request.getParameter("bookno");
	String lentno = request.getParameter("lentno");
	String custname = request.getParameter("custname");
	String outdate = request.getParameter("outdate");
	String indate = request.getParameter("indate");
	
	String bookname="";
	int sel=0;
	/*bookno(도서코드가 빈칸이면 나머지도 빈칸, 
			도서코드 입력시 sql문을 읽어들여 있는거라면 폼에 뿌리고 없으면 알람창을 보냄)  */
	if(bookno==null){
		lentno="";
		custname="";
		bookno="";
		bookname="";
		outdate="";
		indate="";
		
	}else{
		String sql = "select bookno,bookname from bookinfo0930 where bookno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, bookno);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			bookname = rs.getString(2);
			
		}else{
			%>
			<script>
			alert("등록되어 있지 않는 도서코드입니다.");
			history.back(-1);
			</script>
			<%
		}
	}
%>
<form name="reservation" method="post" action="reservation_Insert.jsp">
<table border="3" id="tbn3">
<tr>
<th id="tbn3_tr">대출번호</th>
<td><input type="text" name="lentno" size="10" value="<%=lentno %>"></td>
<th id="tbn3_tr">고객성명</th>
<td><input type="text" name="custname" size="10" value="<%=custname %>" ></td>
</tr>

<tr>
<th id="tbn3_tr">도서코드</th>
<td><input type="text" name="bookno" size="10" value="<%=bookno%>"></td>
<th id="tbn3_tr">도서이름</th>
<td><input type="text" name="bookname" size="10" onchange="javascript:booknames();" value="<%=bookname %>"></td>
</tr>

<tr>
<th id="tbn3_tr">대출일자</th>
<td><input type="text" name="outdate" size="10" value="<%=outdate %>"></td>
<th id="tbn3_tr">반납일자</th>
<td><input type="text" name="indate" size="10" onchange="javascript:booknames();" value="<%=indate %>"
		<%if(indate==""){sel=1;}else{sel=0;} %>><!--반납일자에서 값이 있으면 1 아니면 0으로 sel값이 주어짐 --></td>
<tr>

<tr>
<th id="tbn3_tr">대출상태</th>
<td>
<input type="radio" name="status" value="1" class="che" onchange="javascript:booknames();" <%if(sel==1){%>checked<%} %> >대출 
<input type="radio" name="status" value="2" class="che" onchange="javascript:booknames();" <%if(sel==0){%>checked<%} %> >반납
</td>
<th id="tbn3_tr">등급</th>
<td><select name="class">
<option value="S">S</option>
<option value="A">A</option>
<option value="B">B</option>
<option value="C">C</option>
</select>
</td>
</tr>

<td colspan="4" id="btn">
<input type="button" value="저장" class="bt1" onclick="check('insert')" >
<input type="reset" value="취소" class="bt1">
</td>
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
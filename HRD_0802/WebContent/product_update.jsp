<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품정보 수정화면</title>
<style>
#t{
margin: 0 auto;
width: 700px;
height: 70%;
}
.t{
background-color: #E6E6E6;
}
input{
height: 30px;
}

#bw{
text-align: center;
}
.bw_sw{
width: 100px;
height: 30px;
background-color: #848484;
color: white;
}
select{
height: 30px;
}
</style>
<script>
function check() {
	if(document.form.category.value==""){
		alert("상품분류를 입력하세요.");
		document.form.category.focus();
	}else if(document.form.wname.value==""){
		alert("작성자 이름을 입력하세요.");
		document.form.wname.focus();
	}else if(document.form.pname.value==""){
		alert("상품 이름을 입력하세요.");
		document.form.pname.focus();
	}else{
		document.form.submit();
	}
}
</script>
</head>
<body>
<header><%@include file = "header.jsp" %></header>
<nav><%@include file  =  "nav.jsp" %></nav>
<section>
<%@include file = "dbconn.jsp" %>
<h2>상품 수정</h2>
<form name="form" method="post" action="product_update_process.jsp">
<table border="1" id="t">
<% 
request.setCharacterEncoding("utf-8");
PreparedStatement pstmt = null;
ResultSet rs = null;

String id = request.getParameter("id");
String category =request.getParameter("category");
String wname = request.getParameter("wname");
String pname = request.getParameter("pname");
String sname = request.getParameter("sname");
String price = request.getParameter("price");
String downprice = request.getParameter("downprice");
String inputdate = request.getParameter("inputdate");
String stock = request.getParameter("stock");
String description = request.getParameter("description");

String sql = "select * from product0802";
pstmt=conn.prepareStatement(sql);
rs = pstmt.executeQuery();
if(rs.next()){
	id = rs.getString(1);
	category = rs.getString(2);
	wname = rs.getString(3);
	pname = rs.getString(4);
	sname = rs.getString(5);
	price = rs.getString(6);
	downprice = rs.getString(7);
	inputdate = rs.getString(8);
	stock = rs.getString(9);
	description = rs.getString(10);
}
%>

<tr>
<th class="t">상품 코드</th>
<td><input type="text" name="id" value="<%=id%>"></td>

<th class="t">상품 분류</th>
<td>
<select name="category" value="<%=category%>">
<option value="11">가구</option>
<option value="22">전기/전지</option>
<option value="33">부엌용품</option>
<option value="44">의류</option>
<option value="55">보석 및 액세서리</option>
<option value="66">헬스기구</option>
<option value="77">컴퓨터관련</option>
<option value="88">기타</option>
</select>
</td>

<tr>
<th class="t">작성자 이름</th>
<td><input type="text" name="wname" value="<%=wname%>"></td>

<th class="t">상품 이름</th>
<td><input type="text" name="pname" value="<%=pname%>"></td>
</tr>

<tr>
<th class="t">제조사 이름</th>
<td colspan="4"><input type="text" name="sname" value="<%=sname%>" ></td>
</tr>

<tr>
<th class="t">시중가격</th>
<td><input type="text" name="price" value="<%=price%>"></td>

<th class="t">판매가격</th>
<td><input type="text" name="downprice" value="<%=downprice%>"></td>
</tr>

<tr>
<th class="t">날짜</th>
<td><input type="text" name="inputdate" value="<%=inputdate%>"></td>

<th class="t">재고량</th>
<td><input type="text" name="stock" value="<%=stock%>"></td>
</tr>

<tr>
<th class="t">메모</th>
<td colspan="4"><textarea name="description" cols="55" rows="10"><%=description%></textarea></td> 
</tr>

<tr>
<td colspan="4" id="bw">
<a href="product_select.jsp"><input type="button" value="목록" class="bw_sw"></a>
<input type="button" value="저장" class="bw_sw" onclick="javascript:check()">
</td>
</table>
</form>
</section>
<footer><%@include file = "footer.jsp" %></footer>

</body>
</html>
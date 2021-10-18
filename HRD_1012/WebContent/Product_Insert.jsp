<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 등록</title>
<script type="text/javascript">
function check() {
	if(form.category.value==""){
		alert("상품을 선택하세요.");
		form.category.focus();
		return false;
	}else if(form.wname.value==""){
		alert("작성자 이름을 입력하세요.");
		form.wname.focus();
		return false;
	}else if(form.pname.value==""){
		alert("상품이름을 입력하세요.");
		form.pname.focus();
		return false;
	}else{
		form.submit();
	}
}
</script>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section><%@include file="DBconn.jsp" %>
<br/><h2>상품추가</h2>
<form name="form" method="post" action="Product_InsertProcess.jsp">
<table border="1" id="t1">
<tr>
<th class="in1">상품코드</th>
<%
PreparedStatement pstmt = null;
ResultSet rs = null;
int idx = 0;

String sql = "select product1012_seq.nextval from dual";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();

if(rs.next()){
	idx = rs.getInt(1);
}
%>
<td><input type="text" name="id" value="<%=idx%>"></td>
<th class="in1">상품분류</th>
<td><select name="category" style="width: 150px; height: 30px;">
<option value="">상품 분류</option>
<option value="11">가구</option>
<option value="22">전기/전지</option>
<option value="33">부엌용품</option>
<option value="44">의류</option>
<option value="55">보석 및 액세서리</option>
<option value="66">헬스기구</option>
<option value="77">컴퓨터관련</option>
<option value="88">기타</option>
</select></td>
</tr>

<tr>
<th class="in1">작성자 이름</th>
<td><input type="text" name="wname"></td>
<th class="in1">상품 이름</th>
<td><input type="text" name="pname"></td>
</tr>

<tr>
<th class="in1">제조사 이름</th>
<td colspan="4"><input type="text" name="sname" size="90"></td>
</tr>

<tr>
<th class="in1">시중 가격</th>
<td><input type="text" name="price"></td>
<th class="in1">판매 가격</th>
<td><input type="text" name="downprice"></td>
</tr>

<tr>
<th class="in1">날짜</th>
<td><input type="text" name="inputdate"></td>
<th class="in1">재고량</th>
<td><input type="text" name="stock"></td>
</tr>

<tr>
<th class="in1">메모</th>
<td colspan="4"><textarea rows="10" cols="70"></textarea></td>
</tr>

<tr>
<td colspan="4" id="btn">
<a href="Product_Select.jsp"><input type="button" value="목록" class="bt1"></a>
<input type="button" value="저장" onclick="check()" class="bt1">
</td>
</tr>
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
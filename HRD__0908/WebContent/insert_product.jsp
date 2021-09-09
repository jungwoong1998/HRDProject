<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main화면</title>
<script type="text/javascript">
function check() {
	if(document.form.productId.value==""){
		alert("상품번호를 입력하세요.");
		document.form.id.focus();
	}else if(document.form.productName.value==""){
		alert("상품명을 입력하세요.");
		document.form.name.focus();
	}else{
		document.form.submit();
	}
}
</script>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<h2>상품 정보 등록 화면</h2><hr/>
<form name="form" method="post" action="insert_productProcess.jsp">
<table border="1" id="insert_p">

<tr>
<th>상품코드</th>
<td colspan="4"><input type="text" name="productId" size="80" ></td>
</tr>

<tr>
<th>상품명</th>
<td colspan="4"><input type="text" name="productName" size="80"></td>
</tr>

<tr>
<th>가격</th>
<td colspan="4"><input type="text" name=unitprice size="80"></td>
</tr>

<tr>
<th>상세정보</th>
<td colspan="4"><input type="text" name="description" size="80"></td>
</tr>

<tr>
<th>제조사</th>
<td colspan="4"><input type="text" name="manufacturer" size="80"></td>
</tr>

<tr>
<th>분류</th>
<td><input type="text" name="category" size="50"></td>

<th>재고수</th>
<td><input type="text" name="unitsInstock" size="50"></td>
</tr>

<tr>
<th>상태</th>
<td colspan="4">
<input type="radio" name="condition" value="신규제품">신규제품
<input type="radio" name="condition" value="중고제품">중고제품
<input type="radio" name="condition" value="재생제품">재생제품
</td>
</tr>

<tr>
<td colspan="4" id="btn">
<input type="button" value="상품등록" onclick="javascript:check()" class="btn_a">
<input type="reset" value="다시작성" class="btn_a">
</td>
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
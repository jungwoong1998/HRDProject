<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 등록</title>
<script>
function check() {
	if(document.form.productid.value==""){
		alert("상품코드를 입력하세요.");
		document.form.productid.focus();
	}else if(document.form.name.value==""){
		alert("상품명을 입력하세요.");
		document.form.name.focus();
	}else if(document.form.unitprice.value==""){
		alert("가격을 입력하세요.");
		document.form.unitprice.foucs();
	}else if(document.form.unitprice.value==){
		
	}else if(docu){
		
	}else{
		form.action="addProduct_process.jsp";
	}
}
</script>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<h2>상품 등록 화면</h2><hr/>
<form name="form" method="post" action="addProduct.jsp">
<table border="3" style="margin: 0 auto; width: 600px; height: 300px; ">
<tr>
<th>상품코드</th>
<td><input type="text" name="productid"></td>
</tr>

<tr>
<th>상품명</th>
<td><input type="text" name="name" minlength="4" maxlength="50"></td>
</tr>

<tr>
<th>가 격</th>
<td><input type="number" name="unitprice"></td>
</tr>

<tr>
<th>상세정보</th>
<td><input type="text" name="description"></td>
</tr>

<tr>
<th>제조사</th>
<td><input type="text" name="manufacturer"></td>
</tr>

<tr>
<th>분 류</th>
<td><input type="text" name="categoey"></td>
</tr>

<tr>
<th>재고수</th>
<td><input type="text" name="unitsInstock" ></td>
</tr>

<tr>
<th>상태</th>
<td>
<input type="radio" name="condition" value="신규제품"> 신규 제품
<input type="radio" name="condition" value="중고제품"> 중고 제품
<input type="radio" name="condition" value="재생제품"> 재생 제품
</td>
</tr>

<tr>
<td colspan="2" id="btn">
<input type="button" value="등록" onclick="javascript:check()" class="a">
<input type="reset" value="취소" class="a">
</td>
</tr>
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
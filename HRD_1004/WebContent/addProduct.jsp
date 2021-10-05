<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 화면</title>
<script type="text/javascript">
function check() {
	if(document.add.productid.value==""){
		alert("상품코드를 입력하세요.");
		document.add.productid.focus();
	}else if(document.add.name.value==""){
		alert("상품명을 입력하세요.");
		document.add.name.focus();
	}else if(document.add.name.value.length<4 || document.add.name.value.length>50){
		alert("[상품명]\n최소 4자에서 최대 50자까지 입력하세요");
		document.add.name.focus();
	} else if(add.unitprice.value==""){
		alert("가격을 입력하세요.");
		document.add.unitprice.focus();
	}else if(add.unitprice.value.length==0 || isNaN(add.unitprice.value) ){
	 	alert("[가격]\n숫자만 입력하세요");
	 	document.add.unitprice.focus();
	}else if(add.unitprice.value < 0){
		alert("[가격]\n음수를 입력할 수 없습니다");
	 	document.add.unitprice.focus();
	}else{
		add.submit();
	}
}
</script>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<%@include file="DBconn.jsp" %>
<h1>상품 등록 화면</h1><hr/>
<form name="add" method="post" action="addProductProcess.jsp">
<table border="3" id="tbl">

<tr>
<th class="in1">상품코드</th>
<td><input type="text" name="productid"></td>
</tr>

<tr>
<th>상품명</th>
<td><input type="text" name="name"></td>
</tr>

<tr>
<th>가 격</th>
<td><input type="text" name="unitprice"></td>
</tr>

<tr>
<th>상세정보</th>
<td><input type="text" name="description"></td>
</tr>

<tr>
<th>제조사</th>
<td><input type="text" name="manufacturer" ></td>
</tr>

<tr>
<th>분 류</th>
<td><input type="text" name="category"></td>
</tr>

<tr>
<th>재고수</th>
<td><input type="text" name="unitsInstock"></td>
</tr>

<tr>
<th>상 태</th>
<td>
<input type="radio" name="condition" value="신규제품" class="vr" checked> 신규 제품
<input type="radio" name="condition"  value="중고제품" class="vr"> 중고 제품
<input type="radio" name="condition"  value="재생제품" class="vr"> 재생 제품
</td>
</tr>


<tr>
<td colspan="2" id="btn">
<input type="button" value="등록" onclick="javascript:check()" class="in2">
<input type="reset" value="취소" class="in2">
</td>
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
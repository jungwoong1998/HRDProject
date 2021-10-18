<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품정보 등록</title>
<script type="text/javascript">
function check() {
	if(form.PRODUCTID.value==""){
		alert("상품코드를 입력하세요.");
		form.PRODUCTID.focus();
		return false;
	}if(form.PRODUCTNAME.value==""){
		alert("상품명을 입력하세요.");
		form.PRODUCTNAME.focus();
		return false;
	}
	var cnt = 0;
	var CONDITION = document.getElementsByName("CONDITION");
	
	for(var i=0;i<CONDITION.length;i++){
		if(CONDITION[i].checked == true){
			cnt++;
			break;
		}
	}
	if(cnt==0){
		alert("상태를 선택하세요.");
		return false;
	}
	form.submit();
}
</script>
</head>
<body>
<header><%@include file="header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section><%@include file="DBconn.jsp" %>
<h2>상품 정보 등록 화면</h2><hr/>
<form name="form" method="post" action="insert_productProcess.jsp">
<table border="1" id="t1">

<tr>
<th>상품코드</th>
<td colspan="4"><input type="text" name="PRODUCTID" size="120" ></td>
</tr>

<tr>
<th>상품명</th>
<td colspan="4"><input type="text" name="PRODUCTNAME" size="120"></td>
</tr>

<tr>
<th>가격</th>
<td colspan="4"><input type="text" name="UNITPRICE" size="120"></td>
</tr>

<tr>
<th>상세정보</th>
<td colspan="4"><input type="text" name="DESCRIPTION" size="120"></td>
</tr>

<tr>
<th>제조사</th>
<td colspan="4"><input type="text" name="MANUFACTURER" size="120"></td>
</tr>

<tr>
<th>분류</th>
<td><input type="text" name="CATEGORY" size="40"></td>

<th>재고수</th>
<td><input type="text" name="UNITSINSTOCK" size="40"></td>
</tr>

<tr>
<th>상태</th>
<td colspan="4">
<input type="radio" name="CONDITION" value="신규제품">신규제품
<input type="radio" name="CONDITION" value="중고제품">중고제품
<input type="radio" name="CONDITION" value="재생제품">재생제품
</td>
</tr>

<tr>
<td colspan="4" id="bt1">
<input type="button" value="상품등록" onclick="javascript:check()">
<input type="reset" value="다시작성">
</td>
</tr>

</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
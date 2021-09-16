<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>add화면</title>
<script type="text/javascript">
function mail_chang() {
	if(document.form.mail.options[document.form.mail.selectedIndex].value=='0'){
		document.form.mail2.disabled = true;
		document.form.mail2.value = "";
		//인덱스 0번에 해당하는 것에 값이 들어가면 메일2은 비활성화됨
	}
	if(document.form.mail.options[document.form.mail.selectedIndex].value=='9'){
		document.form.mail2.disabled = false;
		document.form.mail2.value = "";
		document.form.mail2.focus();
		//인덱스 9번에 해당하는 것에 값이 들어가면 메일2은 활성화되고 포커스됨
	}else{
		document.form.mail2.disabled = true;
		document.form.mail2.value = document.form.mail.options[document.form.mail.selectedIndex].value;
		//메일2 값은  메일의 옵션값이 들어감
	} 
}
function check() {
	if(document.form.name.value==""){
		alert("이름을 입력하세요.");
		document.form.name.focus();
	}else if(document.form.password.value==""){
		alert("비밀번호를 입력하세요.");
		document.form.name.focus();
	}else if(document.form.password_re.value==""){
		alert("확인비밀번호를 입력하세요.");
		document.form.password_re.focus();
	}else if(!(document.form.password.value==document.form.password_re.value)){
		alert("비밀번호를 동일하게 입력하세요.");
		document.form.password_re.focus();
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
<h2>회원 가입 등록 화면</h2><hr/>
<form name="form" method="post" action="addMember_process.jsp">
<table border="3" style="margin: 0 auto; width: 600px; height: 300px; ">
<tr>
<th>아이디</th>
<%
PreparedStatement pstmt=null;
ResultSet rs=null;
int idx=0;

String sql="select max(id) from member0914";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();

if(rs.next()){
	idx = rs.getInt(1)+1;
}
%>
<td><input type="text" name="id" value="<%=idx %>">(마지막번호+1)</td>
</tr>

<tr>
<th>성명</th>
<td><input type="text" name="name"></td>
</tr>

<tr>
<th>비밀번호</th>
<td><input type="password" name="password"></td>
</tr>

<tr>
<th>비밀번호 확인</th>
<td><input type="password" name="password_re"></td>
</tr>

<tr>
<th>성 별</th>
<td>
<input type="radio" name="gender" value="남성">남성
<input type="radio" name="gender" value="여성">여성
</td>
</tr>

<tr>
<th>생 일</th>
<td>
<input type="number" min="1960" max="2021" name="birth1" value=<%=2020 %> size="7">년
<select name="birth2">
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
</select>월
<select name="birth3">
<option value="1">1</option> <option value="2">2</option> <option value="3">3</option>
<option value="4">4</option> <option value="5">5</option> <option value="6">6</option>
<option value="7">7</option> <option value="8">8</option> <option value="9">9</option>
<option value="10">10</option> <option value="11">11</option> <option value="12">12</option>
<option value="13">13</option> <option value="14">14</option> <option value="15">15</option>
<option value="16">16</option> <option value="17">17</option> <option value="18">18</option>
<option value="19">19</option> <option value="20">20</option> <option value="21">21</option>
<option value="22">22</option> <option value="23">23</option> <option value="24">24</option>
<option value="25">25</option> <option value="26">26</option> <option value="27">27</option>
<option value="28">28</option> <option value="29">29</option> <option value="30">30</option>
</select>일
</td>
</tr>

<tr>
<th>이메일</th>
<td>
<input type="text" name="mail1" value="이메일"> 
@ <input type="text" name="mail2" value="" disabled>
<select name="mail" onchange="mail_chang()">
<option value="0">선택하세요</option>
<option value="9">직접입력</option>
<option value="gmail.com">gmail.com</option>
<option value="daum.net">daum.net</option>
<option value="naver.com">naver.com</option>
<option value="hotmail.com">hotmail.com</option>
<option value="nate.com">nate.com</option>
</select>
</td>
</tr>

<tr>
<th>연락처</th>
<td><input type="text" name="phone" size="30"></td>
</tr>

<tr>
<th>주소</th>
<td><input type="text" name="address" size="30"></td>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학사정보 수정</title>
<script type="text/javascript">
	function check() {
		if(form.studno.value==""){
			alert("학번이 입력되지 않았습니다.");
			form.studno.focus();
			return false;
		}
		if(form.name.value==""){
			alert("이름이 입력되지 않았습니다.");
			form.name.focus();
			return false;
		}
		var cnt=0;
		var hobby = document.getElementsByName("hobby");
		
		for(var i=0;i<hobby.length;i++){
			if(hobby[i].checked == true){
				cnt++;
				break;
			}
		}
		if(cnt==0){
			alert("취미를 선택하세요.");
			return false;
		}
		form.submit();
		alert("수정이 완료되었습니다!");
	}
</script>
</head>
<body>
<header><%@include file = "header.jsp" %></header>
<nav><%@include file="nav.jsp" %></nav>
<section>
<br/><h2>학사 정보 수정 화면</h2>
<%@include file="DBconn.jsp" %>
<form name="form" method="post" action="Update_StudentProcess.jsp">
<table border="1" id="t2">
<%
PreparedStatement pstmt = null;
ResultSet rs = null;
String studno = request.getParameter("studno");

String sql = "select * from stud1009 where studno=?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, studno);
rs = pstmt.executeQuery();

if(rs.next()){
	String name = rs.getString(2);
	String dept = rs.getString(3);
	String position = rs.getString(4);
	String address = rs.getString(5);
	String phone = rs.getString(6);
	String hobby = rs.getString(7);
	String arr[] = hobby.split(",");

%>
<tr>
<th class="in3">학번</th>
<td><input type="text" name="studno" size="40" value="<%=studno %>"></td>
</tr>

<tr>
<th class="in3">성명</th>
<td><input type="text" name="name" size="40" value="<%=name %>"></td>
</tr>

<tr>
<th class="in3">학과</th>
<td><select name="dept" style="height: 30px; width: 150px">
	<option value="1" <%if(dept.equals("1")){%>selected<%} %>>컴퓨터공학과</option>
	<option value="2" <%if(dept.equals("2")){%>selected<%} %>>기계공학과</option>
	<option value="3" <%if(dept.equals("3")){%>selected<%} %>>전자과</option>
	<option value="4" <%if(dept.equals("4")){%>selected<%} %>>영문학과</option>
	<option value="5" <%if(dept.equals("5")){%>selected<%} %>>일어과</option>
	<option value="6" <%if(dept.equals("6")){%>selected<%} %>>경영학과</option>
	<option value="7" <%if(dept.equals("7")){%>selected<%} %>>무역학과</option>
	<option value="8" <%if(dept.equals("8")){%>selected<%} %>>교육학과</option>
</select></td>
</tr>

<tr>
<th class="in3">학년</th>
<td>
<input type="radio" name="position" value="1" class="in4" <%if(position.equals("1")){%>checked<%} %>> 1학년
<input type="radio" name="position" value="2" class="in4" <%if(position.equals("2")){%>checked<%} %>> 2학년
<input type="radio" name="position" value="3" class="in4" <%if(position.equals("3")){%>checked<%} %>> 3학년
<input type="radio" name="position" value="4" class="in4" <%if(position.equals("4")){%>checked<%} %>> 4학년
</td>
</tr>

<tr>
<th class="in3">취미</th>
<td>
<input type="checkbox" name="hobby" value="프로그램" class="in4" <%for(int i=0;i<arr.length;i++) if("프로그램".equals(arr[i])) out.println("checked"); %>>프로그램
<input type="checkbox" name="hobby" value="독서" class="in4" <%for(int i=0;i<arr.length;i++) if("독서".equals(arr[i])) out.println("checked"); %>>독서
<input type="checkbox" name="hobby" value="등산" class="in4" <%for(int i=0;i<arr.length;i++) if("등산".equals(arr[i])) out.println("checked"); %>>등산
<input type="checkbox" name="hobby" value="여행" class="in4" <%for(int i=0;i<arr.length;i++) if("여행".equals(arr[i])) out.println("checked"); %>>여행
<input type="checkbox" name="hobby" value="낚시" class="in4" <%for(int i=0;i<arr.length;i++) if("낚시".equals(arr[i])) out.println("checked"); %>>낚시
<input type="checkbox" name="hobby" value="영화보기" class="in4" <%for(int i=0;i<arr.length;i++) if("영화보기".equals(arr[i])) out.println("checked"); %>>영화보기
<input type="checkbox" name="hobby" value="잠자기" class="in4" <%for(int i=0;i<arr.length;i++) if("잠자기".equals(arr[i])) out.println("checked"); %>>잠자기
<input type="checkbox" name="hobby" value="멍때리기" class="in4" <%for(int i=0;i<arr.length;i++) if("멍때리기".equals(arr[i])) out.println("checked"); %>>멍때리기
</td>
</tr>

<tr>
<th class="in3">주소</th>
<td><input type="text" name="address" size="40" value="<%=address %>"></td>
</tr>

<tr>
<th class="in3">연락처</th>
<td><input type="text" name="phone" size="40" value="<%=phone%>"></td>
</tr>
<%
}
%>
<tr>
<td colspan="2" id="btn">
<input type="button" value="수정" onclick="javascript:check()" class="btn1">
<input type="reset" value="취소" class="btn1">
</td>
</tr>
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
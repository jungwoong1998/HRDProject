<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학사정보 수정</title>
<script type="text/javascript">
function check() {
	if(document.form.studno.value==""){
		alert("학번이 입력되지 않았습니다.");
		document.form.studno.focus();
	}else if(document.form.name.value==""){
		alert("이름이 입력되지 않았습니다.");
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
<br/><h1>학사 정보 수정 화면</h1>
<form name="form" method="post" action="stud_updateProcess.jsp">
<table border="3" id="tbn_insert">
<%
PreparedStatement pstmt=null;
ResultSet rs=null;
String studno = request.getParameter("studno");

String sql = "select * from stud0923 where studno=?";
pstmt=conn.prepareStatement(sql);
pstmt.setString(1, studno);
rs=pstmt.executeQuery();

if(rs.next()){
	String name  = rs.getString(2);
	String dept = rs.getString(3);
	String position = rs.getString(4);
	String hobby = rs.getString(7);
	String address = rs.getString(5);
	String phone = rs.getString(6);

%>
<tr>
<th width="200px;">학번</th>
<td><input type="text" name="studno" size="50" value="<%=studno%>"></td>
</tr>

<tr>
<th>성명</th>
<td><input type="text" name="name" size="50" value="<%=name%>"></td>
</tr>

<tr>
<th>학과</th>
<td><select name="dept" style="width: 120px; height: 25px;">
<option value="1" <%if(dept.equals("1")){%>selected<%}%> >컴퓨터공학과</option>
<option value="2" <%if(dept.equals("2")){%>selected<%}%> >기계공학과</option>
<option value="3" <%if(dept.equals("3")){%>selected<%}%> >전자과</option>
<option value="4" <%if(dept.equals("4")){%>selected<%}%> >영문학과</option>
<option value="5" <%if(dept.equals("5")){%>selected<%}%> >일어과</option>
<option value="6" <%if(dept.equals("6")){%>selected<%}%> >경영학과</option>
<option value="7" <%if(dept.equals("7")){%>selected<%}%> >무역학과</option>
<option value="8" <%if(dept.equals("8")){%>selected<%}%> >교육학과</option>
</td>
</tr>

<tr>
<th>학년</th>
<td><input type="radio" name="position" value="1" <%if(position.equals("1")){%>checked<%}%> > 1학년
<input type="radio" name="position" value="2" <%if(position.equals("2")){%>checked<%}%> > 2학년
<input type="radio" name="position" value="3" <%if(position.equals("3")){%>checked<%}%> > 3학년
<input type="radio" name="position" value="4" <%if(position.equals("4")){%>checked<%}%>> 4학년
</td>
</tr>

<tr>
<th>취미</th>
<td>
<input type="checkbox" name="hobby" value="프로그램" <%if(hobby.equals("프로그램")){%>checked<%}%> > 프로그램
<input type="checkbox" name="hobby" value="독서" <%if(hobby.equals("독서")){%>checked<%}%> > 독서
<input type="checkbox" name="hobby" value="등산" <%if(hobby.equals("등산")){%>checked<%}%> > 등산
<input type="checkbox" name="hobby" value="여행" <%if(hobby.equals("여행")){%>checked<%}%> > 여행
<input type="checkbox" name="hobby" value="낚시" <%if(hobby.equals("낚시")){%>checked<%}%> > 낚시
<input type="checkbox" name="hobby" value="영화보기" <%if(hobby.equals("영화보기")){%>checked<%}%> > 영화보기
<input type="checkbox" name="hobby" value="잠자기" <%if(hobby.equals("잠자기")){%>checked<%}%> > 잠자기
<input type="checkbox" name="hobby" value="멍때리기" <%if(hobby.equals("멍때리기")){%>checked<%}%> > 멍때리기
</td>
</tr>

<tr>
<th>주소</th>
<td><input type="text" name="address" size="50" value="<%=address %>"></td>
</tr>

<tr>
<th>연락처</th>
<td><input type="text" name="phone" size="50" value="<%=phone %>" ></td>
</tr>
<%
}
%>
<tr>
<td colspan="2" id="btn">
<a href="select_stud.jsp"><input type="button" value="목록" class="btn1"></a>
<input type="button" value="수정" class="btn1" onclick="javascript:check()">
</table>
</form>
</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
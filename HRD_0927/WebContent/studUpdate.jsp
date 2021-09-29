<%@page import="javax.crypto.spec.PSource"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main화면</title>
<script type="text/javascript">
function check() {
	if(document.stud.studno.value==""){
		alert("학번이 입력되지 않았습니다.");
		document.stud.studno.focus();
	}else if(document.stud.name.value==""){
		alert("이름이 입력되지 않았습니다.");
		document.stud.name.focus();
	}else{
		document.stud.submit();
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
<form name="stud" method="post" action="studProcess_Update.jsp">
<table border="3" id="tbn_i3">
<%
PreparedStatement pstmt =null;
ResultSet rs =null;
String studno = request.getParameter("studno");

String sql = "select * from stud0923 where studno=?";
pstmt=conn.prepareStatement(sql);
pstmt.setString(1, studno);
rs=pstmt.executeQuery();

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
<th class="tbn2">학번</th>
<td><input type="text" name="studno" size="30" value="<%=studno %>"></td>
</tr>

<tr>
<th class="tbn2">성명</th>
<td><input type="text" name="name"  size="30" value="<%=name %>"></td>
</tr>

<tr>
<th class="tbn2">학과</th>
<td><select name="dept" class="sele1">
<option value="1" <%if(dept.equals("1")){%>selected<%}%>>컴퓨터공학과</option>
<option value="2" <%if(dept.equals("2")){%>selected<%}%>>기계공학과</option>
<option value="3" <%if(dept.equals("3")){%>selected<%}%>>전자과</option>
<option value="4" <%if(dept.equals("4")){%>selected<%}%>>영문학과</option>
<option value="5" <%if(dept.equals("5")){%>selected<%}%>>일어과</option>
<option value="6" <%if(dept.equals("6")){%>selected<%}%>>경영학과</option>
<option value="7" <%if(dept.equals("7")){%>selected<%}%>>무역학과</option>
<option value="8" <%if(dept.equals("8")){%>selected<%}%>>교육학과</option>
</select></td>
</tr>

<tr>
<th class="tbn2">학년</th>
<td>
<input type="radio" name="position" value="1" class="cil" <%if(position.equals("1")){%>checked<%}%>> 1학년
<input type="radio" name="position" value="2" class="cil" <%if(position.equals("2")){%>checked<%}%>> 2학년
<input type="radio" name="position" value="3" class="cil" <%if(position.equals("3")){%>checked<%}%>> 3학년
<input type="radio" name="position" value="4" class="cil" <%if(position.equals("4")){%>checked<%}%>> 4학년
</td>
</tr>

<tr>
<th class="tbn2">취미</th>
<td>
<input type="checkbox" name=hobby value="프로그램" class="cil" <%for(int i=0;i<arr.length;i++) if("프로그램".equals(arr[i])) out.println("checked");%>>프로그램
<input type="checkbox" name=hobby value="독서" class="cil" <%for(int i=0;i<arr.length;i++) if("독서".equals(arr[i])) out.println("checked");%>>독서
<input type="checkbox" name=hobby value="등산" class="cil" <%for(int i=0;i<arr.length;i++) if("등산".equals(arr[i])) out.println("checked");%>>등산
<input type="checkbox" name=hobby value="여행" class="cil" <%for(int i=0;i<arr.length;i++) if("여행".equals(arr[i])) out.println("checked");%>>여행
<input type="checkbox" name=hobby value="낚시" class="cil" <%for(int i=0;i<arr.length;i++) if("낚시".equals(arr[i])) out.println("checked");%>>낚시
<input type="checkbox" name=hobby value="영화보기" class="cil" <%for(int i=0;i<arr.length;i++) if("영화보기".equals(arr[i])) out.println("checked");%>>영화보기
<input type="checkbox" name=hobby value="잠자기" class="cil" <%for(int i=0;i<arr.length;i++) if("잠자기".equals(arr[i])) out.println("checked");%>>잠자기
<input type="checkbox" name=hobby value="멍때리기" class="cil" <%for(int i=0;i<arr.length;i++) if("멍때리기".equals(arr[i])) out.println("checked");%>>멍때리기
</td>
</tr>

<tr>
<th class="tbn2">주소</th>
<td><input type="text" name="address"  size="30" value="<%=address %>"></td>
</tr>

<tr>
<th class="tbn2">연락처</th>
<td><input type="text" name="phone"  size="30" value="<%=phone %>"></td>
</tr>

<%
}
%>
<tr>
<td colspan="2" id="tbn_i2">
<input type="button" value="수정" onclick="javascript:check()" class="btn_i1">
<input type="reset" value="취소" class="btn_i1">
</td>
</tr>

</table>
</form>

</section>
<footer><%@include file="footer.jsp" %></footer>
</body>
</html>
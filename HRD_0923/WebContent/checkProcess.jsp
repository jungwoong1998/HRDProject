<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String[] value = request.getParameterValues("lang");
for(String val : value){
	out.println("value : "+val+"<br>");
	System.out.println(val);
}
 // 체크박스는 다중선택인데 getParameter로 넘기면 선택 항목중 첫 데이터만 입력이 됨.
 // 그래서 getParameterValues를 줘 String 배열을 만들고 for문을 통해 String 값을 반복 시켜 값을 반복해 입력함
%>
</body>
</html>
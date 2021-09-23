<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="checkProcess.jsp" method="post" name ="form">
관심있는 프로그램 언어는?<br/>
<input type="checkbox" name="lang" value="자바" >자바
<input type="checkbox" name="lang" value="jsp" >jsp
<input type="checkbox" name="lang" value="c++" >c++
<input type="checkbox" name="lang" value="js" >js
<input type="checkbox" name="lang" value="php" >php<br/>
<input type="submit" value="저장">
</form>
</body>
</html>
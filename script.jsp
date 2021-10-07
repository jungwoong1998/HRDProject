<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
function test() {
	if(form.t1.value==""){
		alert("빈칸");
		form.t1.focus();
		return false;
	} /*  */
	if(form.t2.value=="0"){
		alert("선택해");
		form.t2.focus();
		return false;
	}
	var cnt=0;
	var chk = document.getElementsByName("chk");
	
	for(var i=0;i < chk.length;i++){
		if(chk[i].checked==true){
			cnt++;
			break;
		}
	}
	if(cnt==0){
		alert("체크박스 선택");
		return false;
	}
	cnt=0;
	var rao = document.getElementsByName("rao");
	
	for(var i=0;i < rao.length;i++){
		if(rao[i].checked==true){
			cnt++;
			break;
		}
	}
	if(cnt==0){
		alert("라디오버튼 선택");
		return false;
	}
	form.submit();
}
</script>
</head>
<body>
<form name="form">
1.
<input type="text" name="t1"><br/>
2.
<select name="t2">
<option value="0">선택</option>
<option value="1">가</option>
</select><br/>
3.
<input type="checkbox" name="chk" value="1"> 1
<input type="checkbox" name="chk" value="2"> 2
<input type="checkbox" name="chk" value="3"> 3
<br/>
4.
<input type="radio" name=rao" value="m"> 남
<input type="radio" name=rao" value="f"> 여
<br/>

<input type="button" value="제출" onclick="javascript:test()">
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="Membership.css">
</head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Poor+Story&display=swap" rel="stylesheet">

<body align=right>
<form method=post action="login_check.jsp">
<br><br>
<h1 align=center>Login :)</h1>
<br>
<table align=center>
<tr><td class=td>아이디</td><td><input class=sub type=text name=userid></td></tr>
<tr><td class=td>비밀번호</td><td><input class=sub type=password name=passcode></td></tr>
<tr><td colspan=2 align=center><input class=btn type=submit value='로그인'>
				<input class=btn type=button id=btnback value='취소'></td></tr>
</table>
<a href="signon.jsp">회원가입</a>
</form>
<jsp:include page="footer.jsp"/>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>
$('#btnback')
.on('click',function(){
	document.location='home.jsp';
});
$(document)
.on('submit',function(){
	if($('input[name=userid]').val()==""){
		alert('아이디를 확인해주세요');
		return false;
	} else if ($('input[name=passcode]').val()==""){
		alert('비밀번호를 확인해주세요');
		return false;
	}
});
</script>
</html>
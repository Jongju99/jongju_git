<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<h1>로그인하기</h1>
<!-- <form method=get action="/edu/doLogin" id=frmLogin> -->
<table align=center valign=middle>
<tr><td>아이디 :</td><td><input type=text id=userid name=userid value="${userid}"></td></tr>
<tr><td>비밀번호 :</td><td><input type=password id=passcode name=passcode value="${passcode}"></td></tr>
<tr><td><input type=submit value="로그인"></td><td><input type=reset value="취소" onclick='document.location="/edu/"'></td></tr>
<tr><td colspan=2><input type=button id=btnLogin value="Go"></td></tr>
</table>
<!-- </form> -->
<img src="animal/cat1.jfif" width="500px">
</body>
<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click','#btnLogin',function(){
	document.location="/edu/doLogin/"+$('#userid').val()+"/"+$('#passcode').val();
	return false;
})
</script>
</html>
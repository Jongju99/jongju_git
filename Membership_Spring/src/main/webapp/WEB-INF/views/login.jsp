<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<style>
table {
	border-collapse:collapse;
	border:solid 1px gold;
}
td {
	border:2px solid gold;
	padding:10px 10px;
}
</style>
<body align=center>
<h1>로그인하기</h1>
<form method=get action="/member/loginCheck">
<table align=center valign=middle>
	<tr><td>아이디</td><td><input type=text id=userid name=userid></td></tr>
	<tr><td>비밀번호</td><td><input type=password id=passcode name=passcode></td></tr>
	<tr><td><input type=submit value="로그인"></td>
		<td><input type=reset value="취소" onclick='document.location="/member/"'></td></tr>
</table>
</form>
</body>
<script src="http://code.jquery.com/jquery-3.5.0.js"></script>
<script>

</script>
</html>
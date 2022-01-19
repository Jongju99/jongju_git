<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<body>
<form method=get action="/edu/signCheck">
<br><br>
<h1 align=center>Join :)</h1>
<br>
<table align=center>
<tr>
	<td class=td>이름</td><td><input class=sub type=text name=name id=name></td>
	<td class=td>성별</td>
	<td>
	<input type="radio" name="gender" value="Male">남성&nbsp;&nbsp;
	<input type="radio" name="gender" value="Female">여성
	</td>
</tr>
<tr>
	<td class=td>아이디</td><td><input class=sub type=text name=userid></td>
	<td colspan=2></td>
</tr>
<tr>
	<td class=td>비밀번호</td><td><input class=sub type="password" name=passcode></td>
	<td class=td>비밀번호 확인</td><td><input class=sub type="password" name=passcode1></td>
</tr>
<tr>
	<td class=td>모바일번호</td><td><input class=sub type=text name=mobile></td>
	<td colspan=2></td>
</tr>
<tr>
	<td class=td>관심분야</td>
	<td>
	<input type=checkbox name=interest value='정치'>정치&nbsp;&nbsp;
	<input type=checkbox name=interest value='경제'>경제&nbsp;&nbsp;
	<input type=checkbox name=interest value='사회'>사회<br>
	<input type=checkbox name=interest value='문화'>문화&nbsp;&nbsp;
	<input type=checkbox name=interest value='역사'>역사&nbsp;&nbsp;
	<input type=checkbox name=interest value='연예'>연예<br>
	<input type=checkbox name=interest value='스포츠'>스포츠&nbsp;&nbsp;
	<input type=checkbox name=interest value='예술'>예술
	</td>
	<td colspan=2 align=center>
		<input class=btn type=submit value='가입완료'>&nbsp;&nbsp;
		<input class=btn type=button id=btnback value='취소' onclick='document.location="/edu/"'>
	</td>
</tr>
</table>
</form>
</body>
</html>
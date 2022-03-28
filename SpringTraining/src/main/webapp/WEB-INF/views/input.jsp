<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>곱하기</title>
</head>
<body>

<c:if test="${x != null}">
<h1>Result: ${x}</h1>
</c:if>
<form method=get action=/drill/calc>
<table>
<tr><td><input type=text id="x1" name="x1"></td><td><input type=text id="x2" name="x2"></td></tr>
<tr><td><select name="simbol"><option selected>연산자 선택</option>
				<option>+(plus)</option>
				<option>-(minus)</option>
				<option>x(multiply)</option>
				<option>/(divide)</option></select></td>
	<td><input type=submit value=send></td></tr>
</table>
</form>
</body>
</html>
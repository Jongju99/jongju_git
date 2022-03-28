<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역</title>
</head>
<style>
table { border-collapse:collapse}
th,td {border:1px solid black; padding:5px 5px;}
</style>

<body>
<table>
<thead>
	<tr><th>지역번호</th><th>지역세부번호</th><th>지역이름</th><th>지역</th></tr>
</thead>
<tbody>
<c:forEach items="${alCon}" var="con">
	<tr>
		<td>${con.country_id}</td>
		<td>${con.country_iso_code}</td>
		<td>${con.country_name}</td>
		<td>${con.country_region}</td>
	</tr>
</c:forEach>
</tbody>
</table>
</body>
</html>
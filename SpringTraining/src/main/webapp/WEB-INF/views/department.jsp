<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서</title>
</head>
<style>
table { border-collapse:collapse}
th,td {border:1px solid black; padding:5px 5px;}
</style>
<body>
<table>
<thead>
	<tr><th>부서아이디</th><th>부서명</th><th>상위부서명</th><th>부서장이름</th></tr>
</thead>
<tbody>
<c:forEach items="${alCon}" var="depart">
	<tr>
		<td>${depart.did}</td>
		<td>${depart.dname}</td>
		<td>${depart.parent_name}</td>
		<td>${depart.manager_name}</td>
	</tr>
</c:forEach>
</tbody>
</table>
</body>
</html>